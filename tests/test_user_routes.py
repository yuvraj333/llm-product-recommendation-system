# To test cases
import pytest
from fastapi.testclient import TestClient
from app.main import app
from app import models, schemas
from app.database import SessionLocal, engine
from app.hashing import Hash
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from fastapi import status

# Setup testing database
SQLALCHEMY_DATABASE_URL = "sqlite:///:memory:"  # In-memory database for testing
engine = create_engine(SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Create tables in the test database
models.Base.metadata.create_all(bind=engine)

@pytest.fixture
def client():
    # Test client fixture
    client = TestClient(app)
    yield client

@pytest.fixture
def db():
    # Test DB session
    db = SessionLocal()
    yield db
    db.close()

def test_create_user(client: TestClient, db: SessionLocal):
    """Test the user creation endpoint."""
    user_data = {
        "username": "testuser",
        "email": "testuser@example.com",
        "password": "testpassword123"
    }
    response = client.post("/users/", json=user_data)
    
    assert response.status_code == status.HTTP_200_OK
    user = response.json()
    assert user["username"] == user_data["username"]
    assert user["email"] == user_data["email"]
    assert "password_hash" in user  # Ensure password is hashed
    # Verify user is in the database
    db_user = db.query(models.User).filter(models.User.username == "testuser").first()
    assert db_user is not None

def test_register_user(client: TestClient):
    """Test the user registration endpoint."""
    user_data = {
        "username": "registeruser",
        "email": "registeruser@example.com",
        "password": "registerpassword123"
    }
    response = client.post("/users/register", json=user_data)
    
    assert response.status_code == status.HTTP_200_OK
    user = response.json()
    assert user["username"] == user_data["username"]
    assert user["email"] == user_data["email"]

def test_login_user(client: TestClient, db: SessionLocal):
    """Test the user login (JWT token generation) endpoint."""
    # First, create a user in the DB
    user_data = {
        "username": "loginuser",
        "email": "loginuser@example.com",
        "password": "loginpassword123"
    }
    db_user = models.User(
        username=user_data["username"],
        email=user_data["email"],
        password_hash=Hash.hash_password(user_data["password"])
    )
    db.add(db_user)
    db.commit()

    # Then, try to log in
    login_data = {
        "username": user_data["username"],
        "password": user_data["password"]
    }
    response = client.post("/users/login", data=login_data)

    assert response.status_code == status.HTTP_200_OK
    assert "access_token" in response.json()

def test_login_invalid_user(client: TestClient):
    """Test login with invalid credentials."""
    login_data = {
        "username": "invaliduser",
        "password": "wrongpassword"
    }
    response = client.post("/users/login", data=login_data)

    assert response.status_code == status.HTTP_401_UNAUTHORIZED
    assert response.json() == {"detail": "Invalid credentials"}


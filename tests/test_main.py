# from fastapi.testclient import TestClient
# from app.main import app

# client = TestClient(app)

# def test_create_user():
#     response = client.post("/users/", json={"username": "testuser", "email": "testuser@example.com", "password": "testpass"})
#     assert response.status_code == 200
#     assert response.json()["username"] == "testuser"
import secrets

# Generate a 32-byte secret key (256-bit key)
secret_key = secrets.token_hex(32)
print("Generated SECRET_KEY:", secret_key)

# app/main.py
from fastapi import FastAPI
from app.routers import product_routes, user_routes, feedback_routes
from app.routers import product_routes, user_routes, feedback_routes  # Importing the router correctly
from app.database import engine
from app import models
from app.models import Base  # Import Base correctly

app = FastAPI()

# Create tables in the database
models.Base.metadata.create_all(bind=engine)

# Include the routers
app.include_router(user_routes.router, prefix="/users", tags=["users"])
app.include_router(feedback_routes.router, prefix="/feedback", tags=["feedback"])
app.include_router(product_routes.router, prefix="/products", tags=["products"])

@app.get("/")
def read_root():
    return {"message": "Welcome to the product recommendation API!"}

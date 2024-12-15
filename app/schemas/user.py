from pydantic import BaseModel
import datetime

class UserCreate(BaseModel):
    username: str
    email: str
    password: str

class User(BaseModel):
    id: int
    username: str
    email: str
    created_at: datetime.datetime  # Correctly specify the type for created_at

    class Config:
        from_attributes = True  # Enables compatibility with ORM models
        arbitrary_types_allowed = True  # Allows arbitrary types like datetime


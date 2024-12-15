from pydantic import BaseModel

class FeedbackCreate(BaseModel):
    user_id: int
    product_id: int
    feedback: str

class Feedback(BaseModel):
    id: int
    user_id: int
    product_id: int
    feedback: str

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True  # Allow datetime and other arbitrary types

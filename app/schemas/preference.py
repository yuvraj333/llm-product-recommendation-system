# from typing import Optional
from datetime import datetime
from pydantic import BaseModel
class UserPreference(BaseModel):
    preference_id: int
    user_id: int
    preference_key: str
    preference_value: str
    created_at: datetime

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True  # Allow datetime and other arbitrary types

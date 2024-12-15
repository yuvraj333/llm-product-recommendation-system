from pydantic import BaseModel
from datetime import datetime

class SearchHistory(BaseModel):
    search_id: int
    user_id: int
    search_query: str
    search_date: datetime  # Keep datetime as-is

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True  # Allow datetime and other arbitrary types

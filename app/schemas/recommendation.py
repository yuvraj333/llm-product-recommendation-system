from datetime import datetime
from pydantic import BaseModel
class ProductRecommendation(BaseModel):
    recommendation_id: int
    user_id: int
    product_id: int
    recommendation_score: float
    recommended_at: datetime

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True  # Allow datetime and other arbitrary types

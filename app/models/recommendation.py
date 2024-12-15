from sqlalchemy import Column, Integer, String, Text, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base
from sqlalchemy import func
class ProductRecommendation(Base):
    __tablename__ = 'product_recommendations'

    recommendation_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey('users.user_id', ondelete='CASCADE'))
    product_id = Column(Integer, ForeignKey('products.product_id', ondelete='CASCADE'))
    recommendation_score = Column(Text)
    recommended_at = Column(TIMESTAMP, server_default=func.now())

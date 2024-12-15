# feedback.py
from sqlalchemy import Column, Integer, ForeignKey, Text
from sqlalchemy.orm import relationship
from app.database import Base

class Feedback(Base):  # Renamed from UserFeedback to Feedback
    __tablename__ = "user_feedback"

    feedback_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id", ondelete="CASCADE"))
    product_id = Column(Integer, ForeignKey("products.id", ondelete="CASCADE"))
    rating = Column(Integer)
    comments = Column(Text)

    user = relationship("User", back_populates="feedbacks")
    product = relationship("Product", back_populates="feedbacks")

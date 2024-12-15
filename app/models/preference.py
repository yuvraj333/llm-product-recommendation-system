from sqlalchemy import Column, Integer, String, Text, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base
from sqlalchemy import func
class UserPreference(Base):
    __tablename__ = 'user_preferences'

    preference_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey('users.user_id', ondelete='CASCADE'))
    preference_key = Column(String(255), nullable=False)
    preference_value = Column(Text, nullable=False)
    created_at = Column(TIMESTAMP, server_default=func.now())

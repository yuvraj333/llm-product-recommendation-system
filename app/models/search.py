from sqlalchemy import Column, Integer, String, Text, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base
from sqlalchemy import func

class SearchHistory(Base):
    __tablename__ = 'search_history'

    search_id = Column(Integer, primary_key=True, index=True)  # search_id as primary key
    user_id = Column(Integer, ForeignKey('users.id', ondelete='CASCADE'))  # Corrected ForeignKey to 'users.id'
    search_query = Column(Text)  # Store the search query
    search_date = Column(TIMESTAMP, server_default=func.now())  # Automatically sets the current timestamp

    # Optionally, you could add a relationship if you want to access the user directly from SearchHistory
    user = relationship("User", back_populates="search_histories")

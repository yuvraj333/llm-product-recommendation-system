from sqlalchemy import Column, Integer, String, Text,func, TIMESTAMP
from app.database import Base

class Product(Base):
    __tablename__ = 'products'

    product_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    description = Column(Text)
    category = Column(String(255))
    price = Column(Text, nullable=False)
    image_url = Column(Text)
    stock_quantity = Column(Integer, default=0)
    created_at = Column(TIMESTAMP, server_default=func.now())


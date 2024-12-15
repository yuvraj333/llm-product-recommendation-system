from typing import Optional
from datetime import datetime
from pydantic import BaseModel

# Base class for shared attributes across different product-related models
class ProductBase(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    category: Optional[str] = None

# Model for creating a new product
class ProductCreate(ProductBase):
    image_url: Optional[str] = None
    stock_quantity: int

# Model for representing product data, including additional fields
class Product(ProductBase):
    product_id: int
    image_url: Optional[str] = None
    stock_quantity: int
    created_at: datetime

    class Config:
        orm_mode = True
        arbitrary_types_allowed = True  # Allow datetime and other arbitrary types

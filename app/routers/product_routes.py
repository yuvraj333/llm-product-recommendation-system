from fastapi import APIRouter, Depends, HTTPException
from app.schemas.product import Product, ProductCreate  # Correct import for Product schemas
from app import models  # Ensure models is correctly imported
from sqlalchemy.orm import Session
from app.database import get_db
from app.llm_engine import get_recommendations
from app.cache import get_cached_recommendations, set_cached_recommendations

router = APIRouter()

@router.post("/products/", response_model=Product)
def create_product(product: ProductCreate, db: Session = Depends(get_db)):
    new_product = models.Product(**product.dict())
    db.add(new_product)
    db.commit()
    db.refresh(new_product)
    return new_product

@router.get("/products/{product_id}", response_model=Product)  # Correct response model
def get_product(product_id: int, db: Session = Depends(get_db)):
    product = db.query(models.Product).filter(models.Product.id == product_id).first()
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product

@router.post("/recommendations")
async def get_product_recommendations(user_input: str, db: Session = Depends(get_db)):
    cached_recommendations = await get_cached_recommendations(user_input)
    if cached_recommendations:
        return {"recommendations": cached_recommendations}

    products = db.query(models.Product).all()
    recommendations = get_recommendations(user_input, [product.name for product in products])
    await set_cached_recommendations(user_input, recommendations)

    return {"recommendations": recommendations}

@router.get("/search")
def search_products(query: str, db: Session = Depends(get_db)):
    products = db.query(models.Product).filter(models.Product.name.contains(query)).all()
    return products

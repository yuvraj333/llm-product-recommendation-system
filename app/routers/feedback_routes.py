from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/feedback/")
def create_feedback(feedback: schemas.FeedbackCreate, db: Session = Depends(get_db)):
    db_feedback = models.Feedback(product_id=feedback.product_id, user_id=feedback.user_id, comment=feedback.comment)
    db.add(db_feedback)
    db.commit()
    db.refresh(db_feedback)
    return db_feedback

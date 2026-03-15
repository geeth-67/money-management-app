from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

import schemas, crud, database, models

router = APIRouter(prefix="/transactions", tags=["transactions"])


@router.get("/", response_model=list[schemas.TransactionPublic])
def list_transactions(
    page: int = Query(1, ge=1),
    size: int = Query(20, ge=1, le=100),
    search: str | None = Query(None, max_length=100),
    db: Session = Depends(database.get_db)
):
    return crud.list_transactions(db, page=page, size=size, search=search)


@router.get("/{transaction_id}", response_model=schemas.TransactionPublic)
def get_transaction(
    transaction_id: int,
    db: Session = Depends(database.get_db)
):
    db_trans = db.get(models.Transaction, transaction_id)
    if not db_trans:
        raise HTTPException(status_code=404, detail="Transaction not found")
    return db_trans


@router.post("/", response_model=schemas.TransactionPublic, status_code=201)
def create_transaction(
    transaction: schemas.TransactionCreate,
    db: Session = Depends(database.get_db)
):
    category = db.get(models.Category, transaction.category_id)
    if not category:
        raise HTTPException(status_code=400, detail="Category not found")
    return crud.create_transaction(db, trans=transaction)


@router.put("/{transaction_id}", response_model=schemas.TransactionPublic)
def update_transaction(
    transaction_id: int,
    data: schemas.TransactionUpdate,
    db: Session = Depends(database.get_db)
):
    updated = crud.update_transaction(db, transaction_id=transaction_id, data=data)
    if not updated:
        raise HTTPException(status_code=404, detail="Transaction not found")
    return updated


@router.delete("/{transaction_id}", status_code=204)
def delete_transaction(
    transaction_id: int,
    db: Session = Depends(database.get_db)
):
    deleted = crud.delete_transaction(db, transaction_id=transaction_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Transaction not found")
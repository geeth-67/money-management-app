from datetime import datetime, date
from typing import Iterable, Optional

from sqlalchemy import func, select, or_, and_
from sqlalchemy.orm import Session

import models, schemas
from models import Transaction


def create_transaction(db: Session, trans: schemas.TransactionCreate) -> models.Transaction:
    db_trans = models.Transaction(
        category_id=trans.category_id,
        type=trans.type,
        amount=trans.amount,
        note=trans.note,
        date=trans.date or datetime.utcnow(),
    )
    db.add(db_trans)
    db.commit()
    db.refresh(db_trans)
    return db_trans


def update_transaction(db: Session, transaction_id: int, data: schemas.TransactionUpdate) -> type[Transaction] | None:
    db_trans = db.get(models.Transaction, transaction_id)
    if not db_trans:
        return None
    for field, value in data.dict(exclude_unset=True).items():
        setattr(db_trans, field, value)
    db.commit()
    db.refresh(db_trans)
    return db_trans


def delete_transaction(db: Session, transaction_id: int) -> bool:
    db_trans = db.get(models.Transaction, transaction_id)
    if not db_trans:
        return False
    db.delete(db_trans)
    db.commit()
    return True


def list_transactions(
    db: Session,
    page: int = 1,
    size: int = 20,
    search: Optional[str] = None
) -> Iterable[models.Transaction]:
    query = select(models.Transaction)
    if search:
        search_pattern = f"%{search}%"
        query = query.join(models.Category).where(
            or_(
                models.Category.name.ilike(search_pattern),
                models.Transaction.note.ilike(search_pattern)
            )
        )
    query = query.order_by(models.Transaction.date.desc())
    offset = max(page - 1, 0) * size
    query = query.offset(offset).limit(size)
    return db.execute(query).scalars().all()


def transaction_summary(db: Session, start: date, end: date) -> schemas.SummaryResponse:
    totals = db.execute(
        select(
            models.Transaction.type,
            func.sum(models.Transaction.amount)
        ).where(
            and_(
                models.Transaction.date >= datetime.combine(start, datetime.min.time()),
                models.Transaction.date <= datetime.combine(end, datetime.max.time()),
            )
        ).group_by(models.Transaction.type)
    ).all()

    total_income = 0.0
    total_expense = 0.0
    for ttype, total in totals:
        if ttype == models.TransactionType.income:
            total_income = float(total or 0)
        else:
            total_expense = float(total or 0)

    categories = db.execute(
        select(models.Category.name, func.sum(models.Transaction.amount))
        .join(models.Transaction)
        .where(
            and_(
                models.Transaction.date >= datetime.combine(start, datetime.min.time()),
                models.Transaction.date <= datetime.combine(end, datetime.max.time()),
                models.Transaction.type == models.TransactionType.expense,
            )
        )
        .group_by(models.Category.name)
    ).all()

    breakdown = [
        schemas.SummaryCategory(name=cat_name, total=float(total or 0))
        for cat_name, total in categories
    ]

    return schemas.SummaryResponse(
        total_income=total_income,
        total_expense=total_expense,
        breakdown=breakdown,
        period_start=start,
        period_end=end,
    )
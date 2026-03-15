
import enum
from datetime import datetime
from typing import Optional

from sqlalchemy import Column, DateTime, Enum, Float, ForeignKey, Integer, String
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class TransactionType(enum.Enum):
    income = "income"
    expense = "expense"


class Category(Base):
    __tablename__ = "categories"

    id: int = Column(Integer, primary_key=True, index=True)
    name: str = Column(String(50), unique=True, index=True, nullable=False)

    transactions = relationship("Transaction", back_populates="category")


class Transaction(Base):
    __tablename__ = "transactions"

    id: int = Column(Integer, primary_key=True, index=True)
    category_id: int = Column(Integer, ForeignKey("categories.id"), nullable=False)
    type: TransactionType = Column(Enum(TransactionType), nullable=False)
    amount: float = Column(Float, nullable=False)
    note: Optional[str] = Column(String(255), nullable=True)
    date: datetime = Column(DateTime, index=True)

    category = relationship("Category", back_populates="transactions")

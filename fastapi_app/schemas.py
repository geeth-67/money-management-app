from datetime import datetime, date
from typing import Optional, List

from pydantic import BaseModel, Field

from models import TransactionType


class TransactionBase(BaseModel):
    type: TransactionType = Field(..., description="income or expense")
    amount: float = Field(..., gt=0)
    category_id: int
    note: Optional[str] = Field(None, max_length=255)
    date: Optional[datetime] = None


class TransactionCreate(TransactionBase):
    pass


class TransactionUpdate(BaseModel):
    type: Optional[TransactionType] = None
    amount: Optional[float] = Field(None, gt=0)
    category_id: Optional[int] = None
    note: Optional[str] = Field(None, max_length=255)
    date: Optional[datetime] = None


class TransactionPublic(TransactionBase):
    id: int

    class Config:
        orm_mode = True


class SummaryCategory(BaseModel):
    name: str
    total: float


class SummaryResponse(BaseModel):
    total_income: float
    total_expense: float
    breakdown: List[SummaryCategory]
    period_start: date
    period_end: date

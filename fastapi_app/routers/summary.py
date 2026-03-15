from __future__ import annotations

from datetime import date, datetime
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session

import schemas, crud, database

router = APIRouter(prefix="/summary", tags=["summary"])


@router.get("/", response_model=schemas.SummaryResponse)
def get_summary(
    start_date: date | None = Query(None, description="Start date (YYYY-MM-DD)"),
    end_date: date | None = Query(None, description="End date (YYYY-MM-DD)"),
    db: Session = Depends(database.get_db)
):
    today = datetime.utcnow().date()
    if not start_date:
        start_date = today.replace(day=1)
    if not end_date:
        end_date = today
    if start_date > end_date:
        raise HTTPException(status_code=400, detail="start_date must be before end_date")
    return crud.transaction_summary(db, start=start_date, end=end_date)
from fastapi import FastAPI
from database import engine

from models import Base
from routers import transactions, summary

Base.metadata.create_all(bind=engine)


def create_app() -> FastAPI:
    app = FastAPI(
        title="Expense Tracker",
        description="Personal finance tracking application",
    )
    app.include_router(transactions.router)
    app.include_router(summary.router)
    return app


app = create_app()
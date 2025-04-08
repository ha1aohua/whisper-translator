from fastapi import FastAPI
from app.auth import router as auth_router
from app.whisper_api import router as whisper_router

app = FastAPI()

app.include_router(auth_router, prefix="/auth")
app.include_router(whisper_router, prefix="/whisper")

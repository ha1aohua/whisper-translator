from fastapi import APIRouter, File, UploadFile

router = APIRouter()

@router.post("/transcribe")
async def transcribe(file: UploadFile = File(...)):
    return {"text": "Transcription result (mocked)"}

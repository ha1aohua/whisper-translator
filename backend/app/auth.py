from fastapi import APIRouter

router = APIRouter()

@router.post("/register")
def register():
    return {"msg": "User registered (mocked)"}

@router.post("/login")
def login():
    return {"access_token": "fake-token", "token_type": "bearer"}

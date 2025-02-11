from fastapi import FastAPI, Request
from datetime import datetime
import uvicorn

app = FastAPI()

@app.get("/")
async def get_time(request: Request):
    return {
        "timestamp": datetime.utcnow().isoformat(),
        "ip": request.client.host
    }

# Ensure the script runs when executed directly
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

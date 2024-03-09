from fastapi import APIRouter, FastAPI, WebSocket, WebSocketDisconnect
from app.modules.ws.TeamConnectionManager import TeamConnectionManager

router = APIRouter()

manager = TeamConnectionManager()

# TODO - Protect with token authentication
@router.websocket("/stream")
async def websocket_endpoint(ws: WebSocket):
  await manager.connect(ws)
  try:
    while True:
      request = await ws.receive_json()
      await manager.handle_request(request)
  except WebSocketDisconnect:
    manager.disconnect(ws)
from app.modules.hunts.repository import repository

class HuntService:
  def __init__(self):
    self.repository = repository

  async def get_hunts(self):
    return await self.repository.get_all()

service = HuntService()
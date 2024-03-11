from app.modules.teams.repository import repository

class TeamService:
  def __init__(self):
    self.repository = repository

  async def create_team(self, hunt_challenge):
    return await self.repository.create_team(hunt_challenge)


service = TeamService()

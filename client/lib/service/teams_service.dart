import 'dart:convert';
import 'package:praxis_afterhours/entities/team.dart';
import 'package:http/http.dart' as http;

List<Team> _parseTeams(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Team>((json) => Team.fromJson(json)).toList();
}

Future<List<Team>> fetchTeams() async {
  final response = await http.get(
    Uri.parse("http://localhost:8001/hunts/teams/get_team_info"),
  );

  if (response.statusCode == 200) {
    return _parseTeams(response.body);
  } else {
    throw Exception("Failed to load available teams: service");
  }
}

void createTeams(String huntID) {
  String header = json.encode({
    "accept": "application/json",
    "Content-Type": "application/json",
  });

  String jsonData = json.encode({
    // id refers to team id, hunt_id refers to the hunt id
    "hunt_id": huntID,
    "name": "",
    "teamLead": "",
    "players": [],
    "challengeResults": [],
    "invitations": [],
  });

  http.post(
    Uri.parse(
        "http://localhost.8001/hunts/create_teams?headers=$header&json=$jsonData"),
  );
}

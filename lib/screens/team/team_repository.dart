import 'dart:math';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/team.dart';
import 'package:ecellapp/models/team_category.dart';

abstract class TeamRepository {
  Future<List<TeamCategory>> getAllTeamMembers();
}

class FakeTeamRepository implements TeamRepository {
  @override
  Future<List<TeamCategory>> getAllTeamMembers() async {
    // network delay
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "message": "Team members Fetched successfully.",
        "data": [
          {
            "id": 1,
            "name": "Kick Buttowski",
            "profile_url":
                "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "EXC",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          }
        ]
      };

      List<TeamCategory> teamData = List();

      (response["data"] as List).forEach((e) {
        List<Team> teamMember = List();
        (response["data"] as List).forEach((t) => teamMember.add(Team.fromJson(t)));
        teamData.add(TeamCategory(teamMember.last.position, teamMember));
      });

      return teamData;
    }
  }
}

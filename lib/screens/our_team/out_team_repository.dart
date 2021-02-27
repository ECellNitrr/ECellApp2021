import 'dart:math';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/member.dart';

abstract class OurTeamRepository {
  Future<List<Member>> getAllMembers();
}

class OurTeamRepositoryFake implements OurTeamRepository {
  @override
  Future<List<Member>> getAllMembers() async {
    // network delay
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "data": [
          {
            "position": "msdnms",
            "contact": "",
            "description": "none",
            "email": "ansh_srtv@outlook.com",
            "flag": true,
            "id": 1,
            "modified_at": "2021-01-13T11:43:16.131751Z",
            "name": "absan",
            "profile_pic": "/media/static/uploads/speakers/Ansh.jpg",
          }
        ],
        "message": "Member Fetched Successfully"
      };
      return (response["data"] as List).map((e) => Member.fromJson(e)).toList();
    }
  }
}

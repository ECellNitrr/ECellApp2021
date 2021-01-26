import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SpeakerRepository {
  /// All subfunctions are final No arguments required returns json
  Future<List<Map<String, Object>>> speakers();
}

class FakeSpeakerRepository implements SpeakerRepository {
  @override
  Future<List<Map<String, Object>>> speakers() async {
    //Network delay here
    await Future.delayed(Duration(seconds: 1));

    //Fake Response and Network Delay
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "data": [
          {
            "company": "msdnms",
            "contact": "",
            "created_at": "2021-01-13T11:33:00.689210Z",
            "description": "none",
            "email": "ansh_srtv@outlook.com",
            "experience": 2,
            "flag": true,
            "id": 1,
            "modified_at": "2021-01-13T11:43:16.131751Z",
            "name": "absan",
            "profile_pic": "/media/static/uploads/speakers/Ansh.jpg",
            "social_media": "blank",
            "year": 2019
          }
        ],
        "message": "Speakers Fetched Successfully"
      };
      return response["data"];
    }
  }
}

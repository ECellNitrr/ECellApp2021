import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/speaker.dart';

@immutable
abstract class SpeakerRepository {
  /// All subfunctions are final No arguments required returns json
  Future<List<Speaker>> getAllSpeakers();
}

class FakeSpeakerRepository extends SpeakerRepository {
  @override
  Future<List<Speaker>> getAllSpeakers() async {
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
            "profile_pic":
                "https://ichef.bbci.co.uk/news/976/cpsprodpb/7727/production/_103330503_musk3.jpg",
            "social_media": "blank",
            "year": 2019
          }
        ],
        "message": "Speakers Fetched Successfully"
      };

      List<Speaker> speakerList = List();

      (response["data"] as List).map((e) => speakerList.add(Speaker.fromJson(e))).toList();

      return speakerList;
    }
  }
}

class APISpeakerRepository extends SpeakerRepository {
  final String classTag = "APIgetSpeakerRepository";
  @override
  Future<List<Speaker>> getAllSpeakers() async {
    final String tag = classTag + "getAllSpeakers()";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(S.getSpeakerUrl);
    } catch (e) {
      throw NetworkException();
    }

    if (response.statusCode == 200) {
      var speakerResponse = jsonDecode(response.body);
      List<Speaker> speakerList;
      (speakerResponse["data"] as List).forEach((e) => speakerList.add(Speaker.fromJson(e)));
      return speakerList;
    } else if (response.statusCode == 404) {
      throw ValidationException(response.body);
    } else {
      Log.s(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }
}

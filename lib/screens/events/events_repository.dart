import 'dart:math';
import 'dart:convert';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAllEventsRepository {
  /// Takes in nothing, gives the events,their details and throws a suitable exception if something goes wrong.
  Future<List<dynamic>> getAllEvents();
}

class FakegetAllEventsRepository implements GetAllEventsRepository {
  @override
  Future<List<Map<String, Object>>> getAllEvents() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      var json = {
        "message": "Events Fetched successfully",
        "data": [
          {
            "id": 1,
            "name": "Utsav",
            "website_url": "https://ecell.nitrr.ac.in/events/1",
            "venue": "Audi",
            "date": "2021-01-20",
            "time": "bnbn",
            "details": "very nice event",
            "details_html": "",
            "cover_pic": "http://159.65.158.103:3000/media/static/defaults/ecell.png",
            "cover_pic_url": "https://ecell.nitrr.ac.in/media/static/defaults/ecell.png",
            "icon":
                "http://159.65.158.103:3000/media/static/uploads/events/icon/5f898553c928a_Lisiting_logo.jpg",
            "icon_url":
                "https://ecell.nitrr.ac.in/media/static/uploads/events/icon/5f898553c928a_Lisiting_logo.jpg",
            "email": null,
            "flag": true,
            "year": 2019,
            "ecell_user": null,
            "registered": false,
            "no_of_ppl_registered": 0
          }
        ]
      };

      // fake successful response (the data entered here same as in the API Doc example)
      return json["data"];
    }
  }
}

class APIgetAllEventsRepository implements GetAllEventsRepository {
  final String classTag = "APIgetAllEventsRepository";
  @override
  Future<List<dynamic>> getAllEvents() async {
    final String tag = classTag + "getAllEvents";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(
        S.getEventsUrl,
        headers: <String, String>{
          'accept': 'application/json',
        },
      );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 200) {
      Log.i(tag: tag, message: "Request Successful");
      var json = jsonDecode(response.body);
      return json["data"];
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

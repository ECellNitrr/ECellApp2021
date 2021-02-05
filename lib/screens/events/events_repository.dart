import 'dart:math';
import 'dart:convert';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/event.dart';
import 'package:http/http.dart' as http;
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAllEventsRepository {
  /// Takes in nothing, gives the events,their details and throws a suitable exception if something goes wrong.
  Future<List<Events>> getAllEvents();
}

class FakegetAllEventsRepository implements GetAllEventsRepository {
  @override
  Future<List<Events>> getAllEvents() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    if (Random().nextBool()) {
      // random network error
      throw NetworkException();
    } else {
      var json = {
        "message": "Events Fetched successfully.",
        "data": [
          {
            "id": 0,
            "name": "test",
            "venue": "test_venue",
            "date": "2020-09-29T15:21:48.828+00:00",
            "time": "test_time",
            "details": "test_details",
            "details_html": "test.html",
            "cover_pic": "test_cover.jpeg",
            "icon": "test_icon.png",
            "email": "test@email.com",
            "flag": true,
            "year": 2019,
            "ecell_user": 3,
            "created_at": "2020-09-29T15:21:48.828+00:00",
            "modified_at": "2020-09-29T15:21:48.828+00:00"
          }
        ]
      };
      List<Events> events;
      (json["data"] as List).map((e) => events.add((Events.fromJson(e))));
      // fake successful response (the data entered here is same as in the API Doc example)
      return events;
    }
  }
}

class APIgetAllEventsRepository implements GetAllEventsRepository {
  final String classTag = "APIgetAllEventsRepository";
  @override
  Future<List<Events>> getAllEvents() async {
    final String tag = classTag + "getAllEvents";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(
            S.getEventsUrl,
          );
    } catch (e) {
      Log.e(tag: tag, message: "NetworkError:" + e.toString());
      throw NetworkException();
    }

    if (response.statusCode == 200) {
      Log.i(tag: tag, message: "Request Successful");
      var json = jsonDecode(response.body);
      List<Events> events;
      (json["data"] as List).map((e) => events.add((Events.fromJson(e))));
      return events;
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

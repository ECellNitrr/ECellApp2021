import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EventsRepository {
  /// Takes in nothing, gives the events,their details and throws a suitable exception if something goes wrong.
  Future<List<Map<String, Object>>> events();
}

class FakeEventsRepository implements EventsRepository {
  @override
  Future<List<Map<String, Object>>> events() async {
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

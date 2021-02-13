import 'dart:math';

import 'package:ecellapp/models/sponsor_category.dart';
import 'package:ecellapp/models/sponsors_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:ecellapp/core/res/errors.dart';

@immutable
abstract class SponsorsRepository {
  /// All subfunctions are final No arguments required returns json
  Future<List<SponsorCategory>> getAllSponsors();
}

class FakeSponsorsRepository extends SponsorsRepository {
  @override
  Future<List<SponsorCategory>> getAllSponsors() async {
    //Network delay here
    await Future.delayed(Duration(seconds: 1));

    //Fake Response and Network Delay
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "data": {
          "Title": [
            {
              "id": 3,
              "name": "Anopchand Tilokchand Jewellers",
              "details": "Title Sponsors",
              "pic": "/media/static/uploads/sponsors/download.jpeg",
              "pic_url": "\"*\"/media/static/uploads/sponsors/download.jpeg",
              "contact": "",
              "website": "https://atjewel.com/",
              "spons_type": "Title",
              "importance": 200,
              "category_importance": 10,
              "year": 2019,
              "flag": true,
              "ecell_user": null
            }
          ],
          "Partner": [
            {
              "id": 2,
              "name": "Happy Chases",
              "details": "Digital Media Partner",
              "pic": "/media/static/uploads/sponsors/happychases.png",
              "pic_url": "\"*\"/media/static/uploads/sponsors/happychases.png",
              "contact": "",
              "website": "https://www.happychases.com/",
              "spons_type": "Partner",
              "importance": 83,
              "category_importance": 6,
              "year": 2019,
              "flag": true,
              "ecell_user": null
            }
          ]
        },
        "message": "fetched successfully",
        "spons_categories": ["Title", "Partner"]
      };

      List<String> category = List();
      List<SponsorCategory> sponsList = List();
      (response["spons_categories"] as List).forEach((element) => category.add(element.toString()));

      for (var item in category) {
        sponsList
            .add(SponsorCategory.fromClass(SponsorData.fromJsonWithList(response, item), item));
      }

      return sponsList;
    }
  }
}

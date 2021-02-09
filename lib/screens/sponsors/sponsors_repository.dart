import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/sponsors.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SponsorsRepository {
  /// All subfunctions are final No arguments required returns json
  Future<List<Sponsors>> getAllSponsors();
}

class FakeSponsorsRepository implements SponsorsRepository {
  @override
  Future<List<Sponsors>> getAllSponsors() async {
    //Network delay here
    await Future.delayed(Duration(seconds: 1));

    //Fake Response and Network Delay
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "data": {},
        "message": "fetched successfully",
        "spons_categories": [],
      };

      List<Sponsors> sponsorList = List();

      (response["data"] as List).map((e) => sponsorList.add(Sponsors.fromJson(e))).toList();

      return sponsorList;
    }
  }
}

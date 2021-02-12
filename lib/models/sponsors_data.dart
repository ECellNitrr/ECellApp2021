import 'package:ecellapp/models/sponsor.dart';

/// Use this to process response with list from SponsCategoryList encapsules Sponsor Model
class SponsorData {
  List<Sponsor> categoryList;

  SponsorData({this.categoryList});

  factory SponsorData.fromJsonWithList(Map<String, dynamic> json, List<String> category) {
    var sponsorList = new List<Sponsor>();
    for (var item in category) {
      json['data'][item].forEach((v) {
        sponsorList.add(Sponsor.fromJson(v));
      });
    }
    return SponsorData(categoryList: sponsorList);
  }
}

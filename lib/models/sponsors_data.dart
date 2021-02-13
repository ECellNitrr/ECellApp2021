import 'package:ecellapp/models/sponsor.dart';

/// Takes in json response, String category returns SponsData ( List< Sponsor > )
class SponsorData {
  List<Sponsor> categoryList;

  SponsorData({this.categoryList});

  factory SponsorData.fromJsonWithList(Map<String, dynamic> json, String category) {
    var sponsorList = new List<Sponsor>();
    json['data'][category].forEach((v) {
      sponsorList.add(Sponsor.fromJson(v));
    });
    return SponsorData(categoryList: sponsorList);
  }
}

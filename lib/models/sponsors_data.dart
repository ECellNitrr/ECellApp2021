import 'package:ecellapp/screens/sponsors/models/sponsor.dart';

class SponsorData {
  List<Sponsor> categoryList;

  SponsorData({this.categoryList});

  factory SponsorData.fromJsonWithList(Map<String, dynamic> json, List<String> category) {
    var temp = new List<Sponsor>();
    for (var item in category) {
      json['data'][item].forEach((v) {
        print('OK');
        temp.add(Sponsor.fromJson(v));
      });
    }
    return SponsorData(categoryList: temp);
  }
}

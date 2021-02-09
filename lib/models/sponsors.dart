import 'package:ecellapp/screens/sponsors/models/data.dart';

class Sponsor {
  Data data;
  String message;
  List<String> sponsCategories;

  Sponsor({this.data, this.message, this.sponsCategories});

  Sponsor.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    sponsCategories = json['spons_categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['spons_categories'] = this.sponsCategories;
    return data;
  }
}

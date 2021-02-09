import 'title.dart';

class Data {
  List<Category> title;
  List<Category> partner;

  Data({this.title, this.partner});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Title'] != null) {
      title = new List<Category>();
      json['Title'].forEach((v) {
        title.add(new Category.fromJson(v));
      });
    }
    if (json['Partner'] != null) {
      partner = new List<Category>();
      json['Partner'].forEach((v) {
        partner.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['Title'] = this.title.map((v) => v.toJson()).toList();
    }
    if (this.partner != null) {
      data['Partner'] = this.partner.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

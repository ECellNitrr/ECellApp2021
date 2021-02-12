class Sponsor {
  int id;
  String name;
  String details;
  String pic;
  String picUrl;
  String contact;
  String website;
  String sponsType;
  int importance;
  int categoryImportance;
  int year;
  bool flag;
  Null ecellUser;

  Sponsor(
      {this.id,
      this.name,
      this.details,
      this.pic,
      this.picUrl,
      this.contact,
      this.website,
      this.sponsType,
      this.importance,
      this.categoryImportance,
      this.year,
      this.flag,
      this.ecellUser});

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    pic = json['pic'];
    picUrl = json['pic_url'];
    contact = json['contact'];
    website = json['website'];
    sponsType = json['spons_type'];
    importance = json['importance'];
    categoryImportance = json['category_importance'];
    year = json['year'];
    flag = json['flag'];
    ecellUser = json['ecell_user'];
  }
}

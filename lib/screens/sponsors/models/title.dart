class Category {
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

  Category(
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

  Category.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['pic'] = this.pic;
    data['pic_url'] = this.picUrl;
    data['contact'] = this.contact;
    data['website'] = this.website;
    data['spons_type'] = this.sponsType;
    data['importance'] = this.importance;
    data['category_importance'] = this.categoryImportance;
    data['year'] = this.year;
    data['flag'] = this.flag;
    data['ecell_user'] = this.ecellUser;
    return data;
  }
}

/// Essential Model to process and get categories to process Response.
class SponsCategoryList {
  List<String> sponsCategories;
  SponsCategoryList({this.sponsCategories});

  factory SponsCategoryList.fromJson(Map<String, dynamic> json) {
    return SponsCategoryList(sponsCategories: json['spons_categories'] as List<String>);
  }
}
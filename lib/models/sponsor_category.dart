import 'sponsors_data.dart';

/// Contains a  List < Sponsor > and String category
class SponsorCategory {
  final String category;
  SponsorData spons;

  SponsorCategory({this.category, this.spons});

  factory SponsorCategory.fromClass(SponsorData sponsList, String categorySpons) {
    return SponsorCategory(spons: sponsList, category: categorySpons);
  }
}

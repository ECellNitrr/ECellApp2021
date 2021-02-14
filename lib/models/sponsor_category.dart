import 'package:ecellapp/models/sponsor.dart';

/// Contains a  List < Sponsor > and String category
class SponsorCategory {
  final String category;
  List<Sponsor> spons;

  SponsorCategory({this.category, this.spons});

  factory SponsorCategory.fromClass(List<Sponsor> sponsList, String categorySpons) {
    return SponsorCategory(spons: sponsList, category: categorySpons);
  }
}

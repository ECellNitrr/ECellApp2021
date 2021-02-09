import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Sponsors extends Equatable {
  //int
  final int contact;
  final int importance;
  final int categoryImportance;
  final int year;
  final int id;
  //string
  final String name;
  final String details;
  final String pic;
  final String picUrl;
  final String website;
  final String sponsType;

  Sponsors(
      {this.contact,
      this.importance,
      this.categoryImportance,
      this.year,
      this.id,
      this.name,
      this.details,
      this.pic,
      this.picUrl,
      this.website,
      this.sponsType});

  factory Sponsors.fromJson(Map<String, dynamic> json) {
    return Sponsors(
      //int
      id: json[S.sponsorId] as int,
      year: json[S.sponsorYear] as int,
      contact: json[S.sponsorContact] as int,
      categoryImportance: json[S.sponsorCategoryImportance] as int,
      importance: json[S.sponsorImportance] as int,
      //String
      name: json[S.speakerName] as String,
      details: json[S.sponsorDetails] as String,
      pic: json[S.sponsorPic] as String,
      picUrl: json[S.sponsorPicUrl] as String,
      website: json[S.sponsorWebsite] as String,
      sponsType: json[S.sponsorSponsType] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [id];
}

import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Speaker extends Equatable {
  final String comapany;
  final String contact;
  final String createdAt;
  final String description;
  final String email;
  final int experience;
  final bool flag;
  final int id;
  final String modifiedAt;
  final String name;
  final String profilePic;
  final String socialMedia;
  final int year;

  Speaker({
    this.comapany,
    this.contact,
    this.createdAt,
    this.description,
    this.email,
    this.experience,
    this.flag,
    this.id,
    this.modifiedAt,
    this.name,
    this.profilePic,
    this.socialMedia,
    this.year,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      comapany: json[S.speakerCompany] as String,
      contact: json[S.speakerContact] as String,
      createdAt: json[S.speakerCreatedAt] as String,
      description: json[S.speakerDescription] as String,
      email: json[S.speakerEmail] as String,
      experience: json[S.speakerExperience] as int,
      flag: json[S.speakerFlag] as bool,
      id: json[S.speakerId] as int,
      modifiedAt: json[S.speakerModifiedAt] as String,
      name: json[S.speakerName] as String,
      profilePic: json[S.speakerProfilePic] as String,
      socialMedia: json[S.speakerSocialMedia] as String,
      year: json[S.speakerYear] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Speaker extends Equatable {
  final String comapany;
  final String contact;
  final String description;
  final String email;
  final int experience;
  final int id;
  final String name;
  final String profilePic;
  final String socialMedia;
  final int year;

  Speaker({
    this.comapany,
    this.contact,
    this.description,
    this.email,
    this.experience,
    this.id,
    this.name,
    this.profilePic,
    this.socialMedia,
    this.year,
  });

  factory Speaker.fromJson(var json) {
    return Speaker(
      id: json[S.speakerId] as int,
      year: json[S.speakerYear] as int,
      experience: json[S.speakerExperience] as int,
      name: json[S.speakerName] as String,
      email: json[S.speakerEmail] as String,
      contact: json[S.speakerContact] as String,
      comapany: json[S.speakerCompany] as String,
      profilePic: json[S.speakerProfilePic] as String,
      description: json[S.speakerDescription] as String,
      socialMedia: json[S.speakerSocialMedia] as String,
    );
  }

  @override
  List<Object> get props => [];
}

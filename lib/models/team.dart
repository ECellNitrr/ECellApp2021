import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Team extends Equatable {
  //int
  final int id;

  //String
  final String position;
  final String name;
  final String profilePic;
  final String domain;

  Team({
    this.position,
    this.id,
    this.name,
    this.profilePic,
    this.domain,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json[S.teamId] as int,
      name: json[S.teamName] as String,
      position: json[S.teamPosition] as String,
      profilePic: json[S.teamProfilePic] as String,
      domain: json[S.teamDomain] as String,
    );
  }

  @override
  List<Object> get props => [id];
}

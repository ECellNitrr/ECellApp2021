import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Member extends Equatable {
  //int
  final int id;

  //String
  final String position;
  final String name;
  final String profilePic;

  Member({
    this.position,
    this.id,
    this.name,
    this.profilePic,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json[S.memberId] as int,
      name: json[S.memberName] as String,
      position: json[S.memberPosition] as String,
      profilePic: json[S.memberProfilePic] as String,
    );
  }

  @override
  List<Object> get props => [id];
}

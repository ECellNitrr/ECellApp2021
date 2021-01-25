import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json[S.firstnameKey] as String,
      lastName: json[S.lastnameKey] as String,
      email: json[S.emailKey] as String,
      phoneNumber: json[S.passwordKey] as int,
    );
  }

  @override
  List<Object> get props => [User];
}

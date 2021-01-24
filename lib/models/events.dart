import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

class Events extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;

  Events({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      firstName: json[S.firstnameKey] as String,
      lastName: json[S.lastnameKey] as String,
      email: json[S.emailKey] as String,
      phoneNumber: json[S.passwordKey] as int,
    );
  }

  @override
  List<Object> get props => [email];
}

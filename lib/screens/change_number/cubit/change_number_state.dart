part of 'change_number_cubit.dart';

@immutable
abstract class ChangeNumberState {}

class ChangeNumberInitial extends ChangeNumberState {
  String phone;

  void setPhone(String s) {
    phone = s;
  }

  String getPhone() {
    return phone;
  }
}

class ChangeNumberOTP extends ChangeNumberState {}

class ChangeNumberError extends ChangeNumberState {
  final String error;

  ChangeNumberError(this.error);
}

class ChangeNumberWrongOtp extends ChangeNumberState {
  final String error;

  ChangeNumberWrongOtp(this.error);
}

class ChangeNumberOtpSuccessful extends ChangeNumberState {}

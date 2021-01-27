part of 'change_number_cubit.dart';

@immutable
abstract class ChangeNumberState {
  const ChangeNumberState();
}

class ChangeNumberInitial extends ChangeNumberState {}

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

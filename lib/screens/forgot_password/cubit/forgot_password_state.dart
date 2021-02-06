part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotInitial extends ForgotPasswordState {}

class ForgotLoading extends ForgotPasswordState {}

class ForgotEnterOTP extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotWrongOTP extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final String error;

  ForgotPasswordError(this.error);
}

class ForgotPasswordCreateNewPassword extends ForgotPasswordState {}

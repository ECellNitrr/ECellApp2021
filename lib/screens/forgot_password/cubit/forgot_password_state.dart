part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState{}
class ForgotPasswordEnterOTP extends ForgotPasswordState{}
class ForgotPasswordCorrectOTP extends ForgotPasswordState{}
class ForgotPasswordWrongOTP extends ForgotPasswordState{}
class ForgotPasswordError extends ForgotPasswordState{
  final String error;
  ForgotPasswordError(this.error);
}


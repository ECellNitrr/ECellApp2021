part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

// state where we enter email
class ForgotInitial extends ForgotPasswordState {}

// loading state
class ForgotLoading extends ForgotPasswordState {}

//state where we enter the otp for verification
class ForgotEnterOTP extends ForgotPasswordState {}

//state where all things are done
class ForgotPasswordSuccess extends ForgotPasswordState {}

//state where wrong otp is entered
class ForgotWrongOTP extends ForgotPasswordState {}

//network error for forgot password
class ForgotNetworkError extends ForgotPasswordState {
  final String error;

  ForgotNetworkError(this.error);
}

// state where we enter new password
class ForgotCreateNewPassword extends ForgotPasswordState {}

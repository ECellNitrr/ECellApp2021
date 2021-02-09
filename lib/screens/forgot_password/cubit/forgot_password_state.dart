part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

/// loading state
class ForgotLoading extends ForgotPasswordState {}

/// state where we enter email
class ForgotEmailInitial extends ForgotPasswordState {}

/// Success state for email
class ForgotEmailSuccess extends ForgotPasswordState {}

///failure for email
class ForgotEmailFailure extends ForgotPasswordState {}

/// state where we enter the otp for verification
class ForgotOTPInitial extends ForgotPasswordState {}

/// state where wrong otp is entered
class ForgotOTPFailure extends ForgotPasswordState {}

///state where otp is successful
class ForgotOTPSuccess extends ForgotPasswordState {}

/// state where we enter new password
class ForgotResetInitial extends ForgotPasswordState {}

/// state where the password is successfully reset are done
class ForgotResetSuccess extends ForgotPasswordState {}

/// state where the password reset fails
class ForgotResetFailure extends ForgotPasswordState {}

/// network error for forgot password
class ForgotNetworkError extends ForgotPasswordState {
  final String error;

  ForgotNetworkError(this.error);
}

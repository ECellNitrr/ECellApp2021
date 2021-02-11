part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotLoading extends ForgotPasswordState {}

class ForgotEmailInitial extends ForgotPasswordState {}

class ForgotEmailFailure extends ForgotPasswordState {}

class ForgotOTPInitial extends ForgotPasswordState {}

class ForgotOTPFailure extends ForgotPasswordState {}

class ForgotResetInitial extends ForgotPasswordState {}

class ForgotResetSuccess extends ForgotPasswordState {}

class ForgotResetFailure extends ForgotPasswordState {}

class ForgotNetworkError extends ForgotPasswordState {
  final String message;

  ForgotNetworkError(this.message);
}

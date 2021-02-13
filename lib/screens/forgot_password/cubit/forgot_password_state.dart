part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotLoading extends ForgotPasswordState {}

class ForgotEmailInitial extends ForgotPasswordState {}

class ForgotOTPInitial extends ForgotPasswordState {}

class ForgotOTPFailure extends ForgotPasswordState {
  final String message;
  final ForgotPasswordState state;

  ForgotOTPFailure(this.message, this.state);
}

class ForgotResetInitial extends ForgotPasswordState {}

class ForgotResetSuccess extends ForgotPasswordState {}

class ForgotNetworkError extends ForgotPasswordState {
  final String message;
  final ForgotPasswordState state;

  ForgotNetworkError(this.message, this.state);
}

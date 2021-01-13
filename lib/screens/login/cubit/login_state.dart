part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// LoginScreen  implements multuiple states
// 1.Initial
class LoginInitial extends LoginState {
  const LoginInitial();
}

//2.Loading
class LoginLoading extends LoginState {
  const LoginLoading();
}

//3.Success
class LoginSuccess extends LoginState {
  const LoginSuccess();
}

//4.Error
class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object> get props => [message];
}

//5.onSignUpClick
class SignUpRedirect extends LoginState {
  const SignUpRedirect();
}

//6.onForgotPasswordClick
class ForgotPasswordRedirect extends LoginState {
  const ForgotPasswordRedirect();
}

import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/screens/forgot_password/forgot_password_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ecellapp/core/res/strings.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepository _forgotPasswordRepository;

  ForgotPasswordCubit(this._forgotPasswordRepository) : super(ForgotEmailInitial());

  void sendOTP(String email, ForgotPasswordState state) async {
    try {
      emit(ForgotLoading());
      String response = await _forgotPasswordRepository.sendOTP(email);
      if (response == "200") {
        emit(ForgotOTPInitial());
      } else {
        emit(ForgotOTPFailure(response, state));
      }
    } on NetworkException {
      emit(ForgotNetworkError(S.networkException, state));
    }
  }

  Future<void> verifyOTP(String a, ForgotPasswordState state) async {
    emit(ForgotLoading());
    try {
      String response = await _forgotPasswordRepository.verifyOTP(a);
      if (response == "200") {
        emit(ForgotResetInitial());
      } else {
        emit(ForgotOTPFailure(response, state));
      }
    } on NetworkException {
      emit(ForgotNetworkError(S.networkException, state));
    }
  }

  Future<void> changePassword(
      String email, String otp, String password, ForgotPasswordState state) async {
    emit(ForgotLoading());
    try {
      String response = await _forgotPasswordRepository.changePassword(email, otp, password);
      if (response == "200") {
        emit(ForgotResetSuccess());
      } else {
        emit(ForgotOTPFailure(response, state));
      }
    } on NetworkException {
      emit(ForgotNetworkError(S.networkException, state));
    }
  }
}

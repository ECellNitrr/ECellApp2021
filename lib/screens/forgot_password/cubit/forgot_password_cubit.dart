import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/screens/forgot_password/forgot_password_repo.dart';
import 'package:meta/meta.dart';
import 'package:ecellapp/core/res/strings.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepository _forgotPasswordRepository;

  ForgotPasswordCubit(this._forgotPasswordRepository) : super(ForgotPasswordInitial());

  void generateOTPInCubit(String email) async {
    try {
      emit(ForgotPasswordLoading());
      await _forgotPasswordRepository.generateOTP(email);
      emit(ForgotPasswordEnterOTP());
    } on NetworkException {
      emit(ForgotPasswordError(S.networkException));
    }
  }

  Future<void> verifyOTP(String a) async {
    bool b = await _forgotPasswordRepository.verifyOTP(a);
    if (b) {
      emit(ForgotPasswordCorrectOTP());
    } else {
      emit(ForgotPasswordWrongOTP());
    }
  }
}

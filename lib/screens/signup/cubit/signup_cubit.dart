import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/signup/signup_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository _signupRepository;
  SignupCubit(this._signupRepository) : super(SignupInitial());

  Future<void> signup(String name, String email, String password, int mobileNumber) async {
    try {
      emit(SignupLoading());
      await _signupRepository.signup(name, email, password, mobileNumber);
      emit(SignupSuccess());
    } on NetworkException {
      emit(SignupError(S.networkException));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      emit(LoginSuccess());
    } on NetworkException {
      emit(LoginError(S.networkException));
    } on ValidationException catch (e) {
      emit(LoginError(e.description));
    } on ResponseException catch (e) {
      emit(LoginError(e.message));
    }
  }
}

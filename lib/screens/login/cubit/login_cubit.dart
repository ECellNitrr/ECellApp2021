import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/login/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:ecellapp/core/res/errors.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

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

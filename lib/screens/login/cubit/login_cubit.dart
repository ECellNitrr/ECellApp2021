import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/res/errors.dart';
import '../../../core/res/strings.dart';
import '../login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      String token = await _loginRepository.login(email, password);
      emit(LoginSuccess(token));
    } on NetworkException {
      emit(LoginError(S.networkException));
    } on ValidationException catch (e) {
      emit(LoginError(e.description));
    } on ResponseException catch (e) {
      emit(LoginError(e.message));
    }
  }
}

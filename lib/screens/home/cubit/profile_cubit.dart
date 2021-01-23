import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/user.dart';
import 'package:ecellapp/screens/home/tabs/profile/home_repository.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final HomeRepository _homeRepository;
  ProfileCubit(this._homeRepository) : super(ProfileLoading());

  Future<void> profile(String token) async {
    try {
      emit(ProfileLoading());
      User user = await _homeRepository.profile(token);
      emit(ProfileSuccess(user));
    } on NetworkException {
      emit(ProfileError(S.networkException));
    } on ValidationException catch (e) {
      emit(ProfileError(e.description));
    } on UnknownException {
      emit(ProfileError(S.unknownException));
    } catch (e) {
      Log.s(tag: "ProfileCubit", message: "Weird Error. message ->" + e.toString());
    }
  }
}

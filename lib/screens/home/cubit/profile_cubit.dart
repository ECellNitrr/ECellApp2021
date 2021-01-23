import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/res/errors.dart';
import '../../../core/res/strings.dart';
import '../../../core/utils/logger.dart';
import '../../../models/user.dart';
import '../tabs/profile/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(ProfileLoading());

  Future<void> profile(String token) async {
    try {
      emit(ProfileLoading());
      User user = await _profileRepository.profile(token);
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

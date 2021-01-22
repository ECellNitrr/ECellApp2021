import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/user.dart';
import 'package:ecellapp/screens/home/tabs/profile/profile_repository.dart';
import 'package:equatable/equatable.dart';

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
      Log.s(tag: "FakeProfileRepository WeirdResponse", message: "Weird response message ->" + e);
    }
  }
}

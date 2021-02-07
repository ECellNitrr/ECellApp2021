import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/screens/speaker/speaker_repository.dart';
import 'package:equatable/equatable.dart';

part 'speaker_state.dart';

class SpeakerCubit extends Cubit<SpeakerState> {
  final SpeakerRepository _speakerRepository;
  SpeakerCubit(this._speakerRepository) : super(SpeakerLoading());
  Future<void> getSpeakerList() async {
    try {
      emit(SpeakerLoading());
      List<dynamic> json = await _speakerRepository.speakers();
      emit(SpeakerSuccess(json));
    } on NetworkException {
      emit(SpeakerError(S.networkException));
    } on ValidationException catch (e) {
      emit(SpeakerError(e.description));
    } on UnknownException {
      emit(SpeakerError(S.unknownException));
    } catch (e) {
      Log.s(tag: "Speaker Cubit", message: "Unknown Error message:" + e.toString());
    }
  }
}

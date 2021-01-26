part of 'speaker_cubit.dart';

abstract class SpeakerState extends Equatable {
  const SpeakerState();

  @override
  List<Object> get props => [];
}

class SpeakerLoading extends SpeakerState {
  const SpeakerLoading();
}

class SpeakerSuccess extends SpeakerState {
  final List<Map<String, Object>> json;
  const SpeakerSuccess(this.json);
  @override
  List<Object> get props => [json];
}

class SpeakerError extends SpeakerState {
  final String message;
  const SpeakerError(this.message);
  @override
  List<Object> get props => [message];
}

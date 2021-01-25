part of 'events_cubit.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsLoading extends EventsState {
  const EventsLoading();
}

class EventsSuccess extends EventsState {
  final List<Map<String, Object>> json;
  const EventsSuccess(this.json);
  @override
  List<Object> get props => [json];
}

class EventsError extends EventsState {
  final String message;
  const EventsError(this.message);
  @override
  List<Object> get props => [message];
}

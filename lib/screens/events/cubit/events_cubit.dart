import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/screens/events/events_repository.dart';
import 'package:equatable/equatable.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository _eventsRepository;
  EventsCubit(this._eventsRepository) : super(EventsLoading());
  Future<void> events() async {
    try {
      emit(EventsLoading());
      List<dynamic> json = await _eventsRepository.events();
      emit(EventsSuccess(json));
    } on NetworkException {
      emit(EventsError(S.networkException));
    } on ValidationException catch (e) {
      emit(EventsError(e.description));
    } on UnknownException {
      emit(EventsError(S.unknownException));
    } catch (e) {
      Log.s(tag: "EventsCubit", message: "Weird Error. message ->" + e.toString());
    }
  }
}

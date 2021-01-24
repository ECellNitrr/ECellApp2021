import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());
}

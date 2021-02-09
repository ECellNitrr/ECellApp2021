import 'package:bloc/bloc.dart';
import 'package:ecellapp/screens/our_team/out_team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'our_team_state.dart';

class OurTeamCubit extends Cubit<OurTeamState> {
  final OurTeamRepository _ourTeamRepository;

  OurTeamCubit(this._ourTeamRepository) : super(OurTeamInitial());

  void getFaculties() {
    emit(OurTeamInitial());
  }

  void getOverallCoordinators() {
    emit(OurTeamOC());
  }

  void getHeadCoordinators() {
    emit(OurTeamHC());
  }

  void getManagers() {
    emit(OurTeamManager());
  }

  void getExecutives() {
    emit(OurTeamExecutives());
  }
}

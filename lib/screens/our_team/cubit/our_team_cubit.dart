import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/screens/our_team/out_team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../core/res/errors.dart';
import '../../../core/res/strings.dart';
part 'our_team_state.dart';

class OurTeamCubit extends Cubit<OurTeamState> {
  final OurTeamRepository _ourTeamRepository;

  OurTeamCubit(this._ourTeamRepository) : super(OurTeamFaculties());

  Future<void> getFaculties() async {
    try {
      await _ourTeamRepository.getFaculties();
      emit(OurTeamFaculties());
    } on NetworkException {
      emit(OurFacultiesError(S.networkException));
    }
  }

  Future<void> getOverallCoordinators() async {
    try {
      await _ourTeamRepository.getOverallCoordinators();
      emit(OurTeamOC());
    } on NetworkException {
      emit(OurOCError(S.networkException));
    }
  }

  Future<void> getHeadCoordinators() async {
    try {
      await _ourTeamRepository.getHeadCoordinators();
      emit(OurTeamHC());
    } on NetworkException {
      emit(OurHCError(S.networkException));
    }
  }

  Future<void> getManagers() async {
    try {
      await _ourTeamRepository.getManagers();
      emit(OurTeamManager());
    } on NetworkException {
      emit(OurManagerError(S.networkException));
    }
  }

  Future<void> getExecutives() async {
    try {
      await _ourTeamRepository.getExecutives();
      emit(OurTeamExecutives());
    } on NetworkException {
      emit(OurExecutivesError(S.networkException));
    }
  }
}

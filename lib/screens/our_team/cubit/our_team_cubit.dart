import 'package:bloc/bloc.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/models/member.dart';
import 'package:ecellapp/screens/our_team/out_team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../core/res/errors.dart';
import '../../../core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';

part 'our_team_state.dart';

class OurTeamCubit extends Cubit<OurTeamState> {
  final OurTeamRepository _ourTeamRepository;

  OurTeamCubit(this._ourTeamRepository) : super(OurTeamInitial());

  Future<void> getMemberList() async {
    try {
      emit(OurTeamLoading());
      List<Member> memberList = await _ourTeamRepository.getAllMembers();
      emit(OurTeamSuccess(memberList));
    } on NetworkException {
      emit(OurTeamError(S.networkException));
    } on ValidationException catch (e) {
      emit(OurTeamError(e.description));
    } on UnknownException {
      emit(OurTeamError(S.unknownException));
    } catch (e) {
      Log.s(tag: "Member Cubit", message: "Unknown Error message:" + e.toString());
    }
  }
}

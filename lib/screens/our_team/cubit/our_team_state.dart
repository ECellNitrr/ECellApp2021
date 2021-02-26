part of 'our_team_cubit.dart';

@immutable
abstract class OurTeamState extends Equatable {
  const OurTeamState();

  @override
  List<Object> get props => [];
}

class OurTeamInitial extends OurTeamState {
  const OurTeamInitial();
}

class OurTeamLoading extends OurTeamState {
  const OurTeamLoading();
}

class OurTeamSuccess extends OurTeamState {
  final List<Member> memberList;

  const OurTeamSuccess(this.memberList);

  @override
  List<Object> get props => [memberList];
}

class OurTeamError extends OurTeamState {
  final String message;

  const OurTeamError(this.message);

  @override
  List<Object> get props => [message];
}

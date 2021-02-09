part of 'our_team_cubit.dart';

@immutable
abstract class OurTeamState extends Equatable {
  const OurTeamState();

  @override
  List<Object> get props => [];
}

//this state is for Faculties
class OurTeamInitial extends OurTeamState {}

//this state is for OCs
class OurTeamOC extends OurTeamState {}

//this state is for HC
class OurTeamHC extends OurTeamState {}

//this state is for Manager
class OurTeamManager extends OurTeamState {}

//this is for executives
class OurTeamExecutives extends OurTeamState {}

//this state is for network error
class OurTeamNetworkError extends OurTeamState {}

part of 'our_team_cubit.dart';

@immutable
abstract class OurTeamState extends Equatable {
  const OurTeamState();

  @override
  List<Object> get props => [];
}

//this state is for Faculties
class OurTeamFaculties extends OurTeamState {}

class OurFacultiesError extends OurTeamState {
  final String message;

  const OurFacultiesError(this.message);

  @override
  List<Object> get props => [message];
}

//this state is for OCs
class OurTeamOC extends OurTeamState {}

class OurOCError extends OurTeamState {
  final String message;

  const OurOCError(this.message);

  @override
  List<Object> get props => [message];
}

//this state is for HC
class OurTeamHC extends OurTeamState {}

class OurHCError extends OurTeamState {
  final String message;

  const OurHCError(this.message);

  @override
  List<Object> get props => [message];
}

//this state is for Manager
class OurTeamManager extends OurTeamState {}

class OurManagerError extends OurTeamState {
  final String message;

  const OurManagerError(this.message);

  @override
  List<Object> get props => [message];
}

//this is for executives
class OurTeamExecutives extends OurTeamState {}

class OurExecutivesError extends OurTeamState {
  final String message;

  const OurExecutivesError(this.message);

  @override
  List<Object> get props => [message];
}

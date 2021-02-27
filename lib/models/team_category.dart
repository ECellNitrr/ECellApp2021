import 'package:ecellapp/models/team.dart';

/// Contains a list of <Team > and String position
class TeamCategory {
  final String position;
  List<Team> teams;

  TeamCategory(this.position, this.teams);
}

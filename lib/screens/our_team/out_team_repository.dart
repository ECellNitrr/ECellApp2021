abstract class OurTeamRepository {
  void getFaculties();

  void getOverallCoordinators();

  void getHeadCoordinators();

  void getManagers();

  void getExecutives();
}

class OurTeamRepositoryFake implements OurTeamRepository {
  @override
  void getFaculties() {}

  @override
  void getOverallCoordinators() {}

  @override
  void getHeadCoordinators() {}

  @override
  void getManagers() {}

  @override
  void getExecutives() {}
}

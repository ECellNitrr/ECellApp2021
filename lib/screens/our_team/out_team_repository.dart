import 'dart:math';

import 'package:ecellapp/core/res/errors.dart';

abstract class OurTeamRepository {
  Future<void> getFaculties();

  Future<void> getOverallCoordinators();

  Future<void> getHeadCoordinators();

  Future<void> getManagers();

  Future<void> getExecutives();
}

class OurTeamRepositoryFake implements OurTeamRepository {
  @override
  Future<void> getFaculties() async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }

  @override
  Future<void> getOverallCoordinators() async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }

  @override
  Future<void> getHeadCoordinators() async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }

  @override
  Future<void> getManagers() async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }

  @override
  Future<void> getExecutives() async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) {
      throw NetworkException();
    }
  }
}

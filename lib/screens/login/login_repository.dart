abstract class LoginRepository {
  //Takes in login credentials (here id and password)
  //Use by implementing this class
  Future<String> login(String email, String password);
}

class FakeRepository implements LoginRepository {
  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

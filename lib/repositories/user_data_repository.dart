abstract class UserDataRepository {
  Future<List<String>> getUserData();
  Future<String> getReferrer();
}

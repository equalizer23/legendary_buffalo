abstract class SharedPrefRepo {
  Future<void> save(dynamic data, String key);
  Future<dynamic> get(String key);
}

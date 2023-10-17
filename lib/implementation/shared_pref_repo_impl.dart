import 'package:legendary_buffalo/repositories/shared_pref_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepoImpl extends SharedPrefRepo {
  //Returns a data from cache
  @override
  Future get(String key) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      return sharedPref.get(key);
    } catch (e) {
      print('Error getting data');
    }
  }

  //Saves a data in cache
  @override
  Future<void> save(data, String key) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      sharedPref.setString(key, data);
    } catch (e) {
      print('Error  data');
    }
  }
}

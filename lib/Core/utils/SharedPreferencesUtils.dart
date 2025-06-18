import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, dynamic value) {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    }
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else {
      return sharedPreferences.setString(key, value);
    }
  }

  static Object? getData(String key) {
    return sharedPreferences.get(key);
  }
  static Future<bool> deleteToken(String key)async{
    return await sharedPreferences.remove(key);
  }
}

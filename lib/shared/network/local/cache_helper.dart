import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> setValue({required bool value}) async {
    return await sharedPreferences!.setBool('isDark', value);
  }

  static bool? getValue() {
    return sharedPreferences!.getBool('isDark');
  }
}

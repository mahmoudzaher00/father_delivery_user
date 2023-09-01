import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED = "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putDataInSharedPreference({required dynamic value, required String key,}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

  static dynamic getDataFromSharedPreference({required String key,}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> clearDataFromSharedPreference({required String key,}) async {
    return await sharedPreferences!.remove(key);
  }

  // on boarding

  static Future<void> setOnBoardingScreenViewed() async {
    sharedPreferences!.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  static Future<bool> isOnBoardingScreenViewed() async {
    return sharedPreferences!.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ?? false;
  }
}

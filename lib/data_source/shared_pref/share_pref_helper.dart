import 'dart:async';

import 'package:h_shop/app_constants/share_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  Future<bool?> get isFirstTimeOpen async {
    return _sharedPreference.getBool(Preferences.is_first_time_open);
  }

  Future<bool> saveIsFirstTimeOpen(bool isFirstTimeOpen) async {
    return _sharedPreference.setBool(Preferences.is_first_time_open, isFirstTimeOpen);
  }

  Future<bool?> getBool(String key) async {
    return _sharedPreference.getBool(key);
  }

  Future<bool> setBool(String key, bool isDarkTheme) async {
    return _sharedPreference.setBool(key, isDarkTheme);
  }

  // Future<bool> removeAuthToken() async {
  //   return _sharedPreference.remove(Preferences.auth_token);
  // }

}
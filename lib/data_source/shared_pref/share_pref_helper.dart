import 'dart:async';

import 'package:h_shop/app_constants/share_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences _sharedPreference;
  SharedPreferenceHelper(this._sharedPreference);

  Future<bool?> getBool(String key) async {
    return _sharedPreference.getBool(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return _sharedPreference.setBool(key, value);
  }

  // Future<bool> removeAuthToken() async {
  //   return _sharedPreference.remove(Preferences.auth_token);
  // }

}
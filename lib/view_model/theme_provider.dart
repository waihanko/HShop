import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/app_theme.dart';
import 'package:h_shop/app_constants/share_pref_constant.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_source/shared_pref/share_pref_helper.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  ThemeProvider(this._themeData);

  final _sharePreference = locator<SharedPreferenceHelper>();

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  switchTheme() async {
   await _sharePreference.getBool(Preferences.is_dark_mode_on).then((value)  {
      setTheme(value == true ? lightTheme : darkTheme);
    _sharePreference.setBool(Preferences.is_dark_mode_on, !(value??true));
    });
  }

}
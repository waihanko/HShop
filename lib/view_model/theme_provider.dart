import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/app_theme.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_source/shared_pref/share_pref_helper.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  final _sharePreference = locator<SharedPreferenceHelper>();


  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  switchTheme() async {
    _sharePreference.getBool('darkMode').then((value)  {
      setTheme(value == true ? darkTheme : lightTheme);
    _sharePreference.setBool('darkMode', !(value??true));
    });
  }

}
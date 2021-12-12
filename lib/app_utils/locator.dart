import 'package:get_it/get_it.dart';
import 'package:h_shop/data_source/repository_impl.dart';
import 'package:h_shop/data_source/shared_pref/share_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
 await SharedPreferences.getInstance().then(
      (value) => locator.registerFactory(() => SharedPreferenceHelper(value)));
}

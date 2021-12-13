import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_constants/router.dart';
import 'view_model/app_intro_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  var themeProvider = locator<ThemeProvider>();
  var appIntroProvider = locator<AppIntroProvider>();

  return runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => themeProvider,
      ),
      ChangeNotifierProvider(
        create: (context) => appIntroProvider,
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final _themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _themeProvider.getTheme(),
      initialRoute: true == true ? '/' : "home",
      onGenerateRoute: AppPageRoute.generateRoute,
    );
  }
}

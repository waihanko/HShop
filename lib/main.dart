import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_constants/router.dart';
import 'view_model/app_intro_provider.dart';
import 'view_model/shop_profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  var themeProvider = locator<ThemeProvider>();
  var appIntroProvider = locator<AppIntroProvider>();
  var shopProfileProvider = locator<ShopProfileProvider>();

  return runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => themeProvider,
      ),
      ChangeNotifierProvider(
        create: (context) => appIntroProvider,
      ),
      ChangeNotifierProvider(
        create: (context) => shopProfileProvider,
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeProvider>().getTheme(),
      initialRoute: true == true ? '/' : "home",
      onGenerateRoute: AppPageRoute.generateRoute,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('my', '')],
      locale: const Locale('my'),
    );
  }
}

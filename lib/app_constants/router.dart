import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:h_shop/ui/app_intro/app_intro_screen.dart';
import 'package:h_shop/ui/check_out/check_out_screen.dart';
import 'package:h_shop/ui/shop_profile/shop_profile_screen.dart';

const String initialRoute = "login";

class AppPageRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AppIntroScreen());
      case 'home':
        return MaterialPageRoute(builder: (_) => const ShopProfileScreen());
      case 'check_out':
        return MaterialPageRoute(builder: (_) => const CheckOutScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );

      // case 'post':
      //   var post = settings.arguments as Post;
      //   return MaterialPageRoute(builder: (_) => PostView(post: post));

    }
  }
}

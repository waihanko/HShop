import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/section_view_app_bar.dart';
import 'package:provider/provider.dart';

class ShopProfileScreen extends StatefulWidget {
  const ShopProfileScreen({Key? key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();
}

class _ShopProfileScreenState extends State<ShopProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBarSectionView(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.cable),
            onPressed: () => themeProvider.switchTheme()));
  }
}

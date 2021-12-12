import 'package:flutter/material.dart';

class AppBarSectionView extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSectionView({Key? key}) : super(key: key);

  @override
  _AppBarSectionViewState createState() => _AppBarSectionViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarSectionViewState extends State<AppBarSectionView> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}

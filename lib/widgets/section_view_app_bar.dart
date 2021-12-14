import 'package:flutter/material.dart';

class AppBarSectionView extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSectionView({Key? key}) : super(key: key);

  @override
  _AppBarSectionViewState createState() => _AppBarSectionViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _AppBarSectionViewState extends State<AppBarSectionView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.preferredSize.height,
      backgroundColor: Colors.red,
      leading: const Icon(Icons.arrow_back_ios_rounded),
      title: const Text("This Is Title"),
    );
  }
}
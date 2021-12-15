import 'package:flutter/material.dart';
import 'package:h_shop/widgets/widget_heading_text.dart';

class AppBarSectionView extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;

  const AppBarSectionView({Key? key, this.title, this.action}) : super(key: key);

  @override
  _AppBarSectionViewState createState() => _AppBarSectionViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.2);
}

class _AppBarSectionViewState extends State<AppBarSectionView> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.preferredSize.height,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      title: widget.title,
      titleSpacing: 0,
      centerTitle: false,
      actions: [
        widget.action??const SizedBox()
      ],
    );
  }
}

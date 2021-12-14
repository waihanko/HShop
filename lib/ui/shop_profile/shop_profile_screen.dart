import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/section_view_app_bar.dart';
import 'package:h_shop/widgets/shape_item.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';

class ShopProfileScreen extends StatefulWidget {
  const ShopProfileScreen({Key? key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();
}

class _ShopProfileScreenState extends State<ShopProfileScreen> {
  var themeProvider = locator<ThemeProvider>();

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBarSectionView(
        action: IconButton(
          icon: const Icon(
            Icons.more_horiz_rounded,
          ),
          onPressed: () => {},
        ),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cable),
        onPressed: () => themeProvider.switchTheme(),
      ),
    );
  }
}

class ChattingAppBar extends StatelessWidget {
  const ChattingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ShapeItem(
          boxShape: BoxShape.circle,
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitleTextWidget("Wai Han Ko's Shop"),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            NormalTextWidget("Active 3min ago")
          ],
        ),
      ],
    );
  }
}

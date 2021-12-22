import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';

class ChattingAppBarSectionView extends StatelessWidget {
  const ChattingAppBarSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DummyWidget(
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

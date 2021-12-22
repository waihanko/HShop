
import 'package:flutter/cupertino.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/widgets/widget_background.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';

class ShopProfileHeaderSectionView extends StatelessWidget {
  final Profile? shopProfile;

  const ShopProfileHeaderSectionView({
    this.shopProfile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const DummyWidget(
          boxWidth: 68,
          boxHeight: 68,
        ),
        const SizedBox(
          height: MARGIN_CARD_MEDIUM,
        ),
        BackgroundWidget(
          child: NormalTextWidget(shopProfile?.ratingPoint.toString() ?? ""),
        ),
        const SizedBox(
          height: MARGIN_CARD_MEDIUM,
        ),
        TitleTextWidget(shopProfile?.shopName ?? ""),
        const SizedBox(
          height: MARGIN_CARD_MEDIUM,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DummyWidget(
              boxWidth: 86,
              boxHeight: 38,
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            DummyWidget(
              boxWidth: 86,
              boxHeight: 38,
            ),
          ],
        ),
        const SizedBox(
          height: MARGIN_LARGE,
        ),
      ],
    );
  }
}
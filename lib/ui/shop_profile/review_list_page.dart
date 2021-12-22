import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:provider/provider.dart';

class ReviewListPage extends StatefulWidget {
  final int categoryId;

  const ReviewListPage({required this.categoryId, Key? key}) : super(key: key);

  @override
  _ReviewListPageState createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  void initState() {
    shopProfileProvider.getReviewList(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProfileProvider>(
      builder: (context, shopProfileProvider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Container(
                        width: double.infinity,
                        height: 80,
                        margin: const EdgeInsets.only(
                          bottom: MARGIN_MEDIUM_2,
                        ),
                        color: Colors.blue,
                        child: Container()),
                    childCount: shopProfileProvider.reviewListDao?.reviews?.length,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: MARGIN_MEDIUM),
                width: double.infinity,
                height: 40,
                color: Colors.pink,
              ),
            )
          ],
        ),
      ),
    );
  }
}

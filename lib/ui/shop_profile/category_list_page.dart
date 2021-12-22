import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatefulWidget {
  final int shopId;

  const CategoryListPage({required this.shopId, Key? key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  void initState() {
    shopProfileProvider.getCategoryList(widget.shopId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProfileProvider>(
        builder: (context, shopProfileProvider, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            crossAxisSpacing: MARGIN_MEDIUM_2,
                            mainAxisSpacing: MARGIN_MEDIUM_2),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          Container(color: Colors.blue, child: Container()),
                      childCount: shopProfileProvider
                          .categoryListDao?.categories?.length,
                    ),
                  ),
                ],
              ),
            ));
  }
}

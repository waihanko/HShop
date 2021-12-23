import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  final int categoryId;

  const ProductListPage({required this.categoryId, Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  void initState() {
    shopProfileProvider.getProductList(widget.categoryId);
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.7,
                  crossAxisSpacing: MARGIN_MEDIUM_2,
                  mainAxisSpacing: MARGIN_MEDIUM_2),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.pink,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: MARGIN_MEDIUM,
                                    left: MARGIN_MEDIUM,
                                    child: DummyWidget(
                                      boxHeight: 28,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: DummyWidget(
                              onPress:()=>  shopProfileProvider.handleCartItemQuantity(shopProfileProvider.productListDao!.products![index]) ,
                              child: Text("Add"),
                              color: Colors.red,
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.green,
                            )),
                      ],
                    )),
                childCount:
                    shopProfileProvider.productListDao?.products?.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

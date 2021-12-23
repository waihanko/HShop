import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight) * 1.2;

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: widget.preferredSize.height,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _shoppingCartBadge(),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                  width: double.infinity,
                  height: 80,
                  margin: const EdgeInsets.only(
                    bottom: MARGIN_MEDIUM_2,
                  ),
                  color: Colors.blue,
                  child: Container(
                    child: Text("Product - ${shopProfileProvider.cardProduct![index].item.productName} \n Count is -> ${shopProfileProvider.cardProduct![index].totalQuantity}"),
                  )),
              childCount: shopProfileProvider.cardProduct?.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      showBadge: shopProfileProvider.cardProduct!.isNotEmpty,
      badgeContent: Text(
        "${shopProfileProvider.totalQtyInCart}",
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, "check_out")),
    );
  }

}

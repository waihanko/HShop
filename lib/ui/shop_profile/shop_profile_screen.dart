
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/app_utils/sliver_app_delegete.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/ui/shop_profile/category_list_page.dart';
import 'package:h_shop/ui/shop_profile/product_list_page.dart';
import 'package:h_shop/ui/shop_profile/review_list_page.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/section_view_profile_header.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ShopProfileScreen extends StatefulWidget implements PreferredSizeWidget {
  const ShopProfileScreen({Key? key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight) * 1.2;
}

class _ShopProfileScreenState extends State<ShopProfileScreen>
    with TickerProviderStateMixin {
  var themeProvider = locator<ThemeProvider>();
  var shopProfileProvider = locator<ShopProfileProvider>();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    shopProfileProvider.getShopProfile().then((value) {
      _tabController = TabController(
          vsync: this,
          length: shopProfileProvider.shopProfileDao?.categories?.length ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    //  themeProvider = Provider.of<ShopProfileProvider>(context, listen: true);
    return Scaffold(
      body: Consumer<ShopProfileProvider>(
        builder: (context, shopProfileProvider, child) => DefaultTabController(
          length: shopProfileProvider.shopProfileDao?.categories?.length ?? 0,
          child: getData(),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.height),
      //   onPressed: () => themeProvider.switchTheme(),
      // ),
    );
  }

  getData() {
    if (shopProfileProvider.shopProfileDao != null) {
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
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
              SliverToBoxAdapter(
                child: ShopProfileHeaderSectionView(
                  shopProfile: shopProfileProvider.shopProfileDao?.profile,
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicator: DotIndicator(
                      color: Colors.black,
                      distanceFromCenter: 16,
                      radius: 3,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    tabs: shopProfileProvider.shopProfileDao!.categories!
                        .map(
                          (item) => Tab(
                            height: 52,
                            text: item.categoryName,
                          ),
                        )
                        .toList(),
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: shopProfileProvider.shopProfileDao!.categories!
                .map(
                  (item) => getTabBarView(item),
                )
                .toList(),
          ));
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }

  Widget getTabBarView(Categories item) {
    if (item.id == 1 || item.id == 2 || item.id == 3) {
      //shopProfileProvider.shopProfileDao!.profile!.setShopName = "HHHH";

      return ProductListPage(
        categoryId: item.id!,
      );
    } else if (item.id == 4) {
      return CategoryListPage(
        shopId: item.id!,
      );
    } else if (item.id == 5) {
      return ReviewListPage(
        categoryId: item.id!,
      );
    } else {
      return Container();
    }
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



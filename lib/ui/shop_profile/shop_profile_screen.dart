import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/widget_background.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';
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

  @override
  void initState() {
    super.initState();
    shopProfileProvider.getShopProfile();
  }

  @override
  Widget build(BuildContext context) {
    //  themeProvider = Provider.of<ShopProfileProvider>(context, listen: true);
    return Scaffold(
      body: Consumer<ShopProfileProvider>(
          builder: (context, shopProfileProvider, child) =>
              DefaultTabController(
                  length:
                      shopProfileProvider.shopProfileDao?.categories?.length ??
                          0,
                  child: getData())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.height),
        onPressed: () => themeProvider.switchTheme(),
      ),
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
              ),
              SliverToBoxAdapter(
                child: ShopProfileHeaderView(
                  shopProfile: shopProfileProvider.shopProfileDao?.profile,
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
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
    if (item.id == 1 || item.id == 2 || item.id == 3 ) {
      return  ProfileCategoriesPage(
        categoryId: item.id!,
      );
    }else if(item.id == 4){
      return  CategoryListPage(
        shopId: item.id!,
      );
    }
    else if (item.id == 5) {
      return  ReviewListPage(
        categoryId: item.id!,
      );
    } else {
      return Container();
    }
  }
}

class ProfileCategoriesPage extends StatefulWidget {
  final int categoryId;

  const ProfileCategoriesPage({required this.categoryId, Key? key})
      : super(key: key);

  @override
  _ProfileCategoriesPageState createState() => _ProfileCategoriesPageState();
}

class _ProfileCategoriesPageState extends State<ProfileCategoriesPage> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  void initState() {
    shopProfileProvider.getProductList(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProfileProvider>(
      builder: (context, shopProfileProvider, child) =>
          TextButton(
            child:  Text("${shopProfileProvider.productListDao?.products?.length??""}"),
            onPressed: () =>{},
          ),
    );
  }
}

class ReviewListPage extends StatefulWidget {
  final int categoryId;

  const ReviewListPage({required this.categoryId, Key? key})
      : super(key: key);

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
      builder: (context, shopProfileProvider, child) =>
          TextButton(
            child:  Text("${shopProfileProvider.reviewListDao?.reviews?.length??""}"),
            onPressed: () =>{},
          ),
    );
  }
}

class CategoryListPage extends StatefulWidget {
  final int shopId;

  const CategoryListPage({required this.shopId, Key? key})
      : super(key: key);

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
      builder: (context, shopProfileProvider, child) =>
          TextButton(
            child:  Text("${shopProfileProvider.categoryListDao?.categories?.length??""}"),
            onPressed: () =>{},
          ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.tabBar);

  final TabBar? tabBar;

  @override
  double get minExtent => tabBar!.preferredSize.height;

  @override
  double get maxExtent => tabBar!.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}

class ChattingAppBar extends StatelessWidget {
  const ChattingAppBar({Key? key}) : super(key: key);

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

class ShopProfileHeaderView extends StatelessWidget {
  final Profile? shopProfile;

  const ShopProfileHeaderView({
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

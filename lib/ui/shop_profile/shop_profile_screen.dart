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
  final numLists = [];
  final numberOfItemsPerList = 3;
  final _innerList = <dynamic>[];
  TabController? _myTabController;

  // late var themeProvider;
  @override
  void initState() {
    super.initState();
    for (int j = 0; j < numberOfItemsPerList; j++) {
      _innerList.add(const ColorRow());
    }
    shopProfileProvider.getShopProfile();
  }

  @override
  Widget build(BuildContext context) {
    //  themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      body: Consumer<ShopProfileProvider>(
          builder: (context, shopProfileProvider, child) => getData()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.height),
        onPressed: () => themeProvider.switchTheme(),
      ),
    );
  }

  getData() {
    if (shopProfileProvider.shopProfileDao != null) {
      _myTabController = TabController(
          vsync: this,
          length: shopProfileProvider.shopProfileDao?.categories?.length ?? 0,
          initialIndex: 0);

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
                    controller: _myTabController,
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
            controller: _myTabController,
            children: shopProfileProvider.shopProfileDao!.categories!
                .map(
                  (item) => getTabBarView(item),
                )
                .toList(),
            // children: [
            //   CustomScrollView(
            //     slivers: [
            //       SliverList(
            //         delegate: SliverChildBuilderDelegate(
            //           (BuildContext context, int index) => _innerList[index],
            //           childCount: numberOfItemsPerList,
            //         ),
            //       ),
            //     ],
            //   ),
            // Container(
            //   child: Center(
            //     child: Text("Tab 2"),
            //   ),
            // ),
            // Container(
            //   child: Center(
            //     child: Text("Tab 3"),
            //   ),
            // ),
            // Container(
            //   child: Center(
            //     child: Text("Tab 4"),
            //   ),
            // ),
            // Container(
            //   child: Center(
            //     child: Text("Tab 5"),
            //   ),
            // ),
            // ],
          ));
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }

  Widget getTabBarView(Categories item) {
    switch (item.id) {
      case 1:
        return const ProfileCategoriesPage(
          bgColor: Colors.red,
        );
      case 2:
        return const ProfileCategoriesPage(
          bgColor: Colors.brown,
        );
      case 3:
        return const ProfileCategoriesPage(
          bgColor: Colors.lightGreen,
        );
      case 4:
        return const ProfileCategoriesPage(
          bgColor: Colors.deepOrange,
        );
      case 5:
        return const ProfileCategoriesPage(
          bgColor: Colors.lightBlue,
        );
      default:
        return Container();
    }
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

class ProductSectionView extends StatefulWidget {
  const ProductSectionView({Key? key}) : super(key: key);

  @override
  State<ProductSectionView> createState() => _ProductSectionViewState();
}

class _ProductSectionViewState extends State<ProductSectionView> {
  List<SliverList> innerLists = [];
  final numLists = 15;
  final numberOfItemsPerList = 100;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < numLists; i++) {
      final _innerList = <ColorRow>[];
      for (int j = 0; j < numberOfItemsPerList; j++) {
        _innerList.add(const ColorRow());
      }
      innerLists.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => _innerList[index],
            childCount: numberOfItemsPerList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: innerLists);
  }
}

class ColorRow extends StatefulWidget {
  const ColorRow({Key? key}) : super(key: key);

  @override
  State createState() => ColorRowState();
}

class ColorRowState extends State<ColorRow> {
  Color? color;

  @override
  void initState() {
    super.initState();
    color = randomColor();
  }

  @override
  Widget build(BuildContext context) {
    print('Building ColorRowState');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            randomColor(),
            randomColor(),
          ],
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.white),
          ),
          Flexible(
            child: Column(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('I\'m a widget!',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color randomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

class ProfileCategoriesPage extends StatefulWidget {
  final Color bgColor;

  const ProfileCategoriesPage({this.bgColor = Colors.white, Key? key})
      : super(key: key);

  @override
  _ProfileCategoriesPageState createState() => _ProfileCategoriesPageState();
}

class _ProfileCategoriesPageState extends State<ProfileCategoriesPage> {
  var shopProfileProvider = locator<ShopProfileProvider>();

  @override
  void initState() {
    shopProfileProvider.setTempColor(widget.bgColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProfileProvider>(
      builder: (context, shopProfileProvider, child) => GestureDetector(
        onTap: () => shopProfileProvider.setTempColor(Colors.deepPurple),
        child: Container(
          color: shopProfileProvider.tempBgColor,
        ),
      ),
    );
  }
}

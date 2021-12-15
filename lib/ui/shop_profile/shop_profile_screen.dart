import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/shop_profile_provider.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/widget_background.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';
import 'package:provider/provider.dart';

class ShopProfileScreen extends StatefulWidget implements PreferredSizeWidget {
  const ShopProfileScreen({Key? key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight) * 1.2;
}

class _ShopProfileScreenState extends State<ShopProfileScreen> {
  var themeProvider = locator<ThemeProvider>();
  var shopProfileProvider = locator<ShopProfileProvider>();
  List<SliverList> innerLists = [];
  final numLists = [];
  final numberOfItemsPerList = 100;
  final _innerList = <dynamic>[];

  @override
  void initState() {
    super.initState();
    for (int j = 0; j < numberOfItemsPerList; j++) {
      _innerList.add(const ColorRow());
    }
  }

  @override
  Widget build(BuildContext context) {

    shopProfileProvider.toolBarHeight = MediaQuery.of(context).padding.top;
    shopProfileProvider.expandedHeight = MediaQuery.of(context).size.height * 0.35;
    shopProfileProvider.toolBarHeight = widget.preferredSize.height;

    double expandedHeight = MediaQuery.of(context).size.height * 0.35;
    double size = 80;
    double collapsePercent = 100;

    return Scaffold(
      body: Consumer<ShopProfileProvider>(
        builder: (context, shopProfileProvider, child) =>
        DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: widget.preferredSize.height,
                  collapsedHeight: widget.preferredSize.height,
                  expandedHeight: expandedHeight,
                  floating: true,
                  pinned: true,
                  titleSpacing: 0,
                  title: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: shopProfileProvider.dynamicProfileSize,
                      child: const DummyWidget(boxShape: BoxShape.circle,color: Colors.amber,)),
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.more_horiz_rounded),
                      onPressed: () => {},
                    )
                  ],
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    shopProfileProvider.getCollapsePercent(constraints.biggest.height);
                    // collapsePercent = ((constraints.biggest.height -  widget.preferredSize.height - MediaQuery.of(context).padding.top)/ (expandedHeight - widget.preferredSize.height)) * 100;
                    //   print(constraints.biggest.height -  MediaQuery.of(context).padding.top - widget.preferredSize.height  );
                    //  print(widget.preferredSize.height);
                    print(shopProfileProvider.dynamicProfileSize);
                    return Container(
                      margin: EdgeInsets.only(
                          top: widget.preferredSize.height),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: ShopProfileHeaderView(
                        constraints.biggest.height,
                        expandedHeight,
                      ),
                    );
                  }),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Tab 1"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _innerList[index],
                    childCount: numberOfItemsPerList,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.height),
        onPressed: () => themeProvider.switchTheme(),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
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
  final double dynamicHeight;
  final double expandedHeight;

  const ShopProfileHeaderView(
    this.dynamicHeight,
    this.expandedHeight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds:200),
      opacity: dynamicHeight > expandedHeight / 1.8 ? 1.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DummyWidget(
                boxWidth: 68,
                boxHeight: 68,
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              const BackgroundWidget(
                child: NormalTextWidget("Best Seller"),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              const TitleTextWidget("Han SpaceX Company"),
              const SizedBox(
                height: MARGIN_MEDIUM,
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
              )
            ],
          ),
        ),
      ),
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

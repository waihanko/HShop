import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/widget_background.dart';
import 'package:h_shop/widgets/widget_dummy.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/widget_title_text.dart';

class ShopProfileScreen extends StatefulWidget {
  const ShopProfileScreen({Key? key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();
}

class _ShopProfileScreenState extends State<ShopProfileScreen> {
  var themeProvider = locator<ThemeProvider>();
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
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: const Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
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
  const ShopProfileHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const DummyWidget(
          boxWidth: 68,
          boxHeight: 68,
        ),
        const BackgroundWidget(
          child: NormalTextWidget("Top Seller"),
        ),
        const TitleTextWidget("Han SpaceX Company"),
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

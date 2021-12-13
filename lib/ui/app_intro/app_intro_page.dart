import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_source/shared_pref/share_pref_helper.dart';
import 'package:h_shop/view_model/app_intro_provider.dart';
import 'package:h_shop/view_model/theme_provider.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:provider/provider.dart';

class AppIntroPage extends StatefulWidget {
  const AppIntroPage({Key? key}) : super(key: key);

  @override
  _AppIntroPageState createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  var sharePreference = locator<SharedPreferenceHelper>();
  var provider = locator<AppIntroProvider>();
  double _position = 0;

  @override
  void initState() {
    provider.getAppIntroItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => provider,
        child: Consumer<AppIntroProvider>(
          builder: (context, model, child) => model.appIntroItemsDao == null
              ? Container(
                  color: Colors.yellow,
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          child: const NormalTextWidget('Skip'),
                          onPressed: () {
                            print('Pressed');
                          }),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: PageView(
                          onPageChanged: (page) =>
                              provider.changeCurrentPageIndex(page.toDouble()),
                          children: model.appIntroItemsDao!.introItems!
                              .map((popularMovie) => Container(
                                  width: 200,
                                  height: 200,
                                  color: Colors.red,
                                  child: Text("${popularMovie.title}")))
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Visibility(
                            visible: provider.currentPageIndex != 0,
                            child: Container(width: 40, color: Colors.yellow),
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                          ),
                          Expanded(
                            child: DotsIndicator(
                              dotsCount:
                                  model.appIntroItemsDao!.introItems!.length,
                              position: provider.currentPageIndex,
                              decorator: DotsDecorator(),
                            ),
                          ),
                          (provider.currentPageIndex == model.appIntroItemsDao!.introItems!.length - 1)
                              ? Container(width: 40, color: Colors.lightGreen)
                              : Container(
                                  width: 40,
                                  color: Colors.deepOrange,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class AppIntroItem extends StatelessWidget {
  final Color bgColor;

  const AppIntroItem({
    this.bgColor = Colors.red,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
    );
  }
}

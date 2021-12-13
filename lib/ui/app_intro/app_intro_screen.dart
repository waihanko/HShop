import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:h_shop/app_constants/dimens.dart';
import 'package:h_shop/app_constants/share_pref_constant.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_source/shared_pref/share_pref_helper.dart';
import 'package:h_shop/view_model/app_intro_provider.dart';
import 'package:h_shop/widgets/widget_normal_text.dart';
import 'package:h_shop/widgets/wire_frame_clickable_item.dart';
import 'package:provider/provider.dart';

class AppIntroScreen extends StatefulWidget {
  const AppIntroScreen({Key? key}) : super(key: key);

  @override
  _AppIntroScreenState createState() => _AppIntroScreenState();
}

class _AppIntroScreenState extends State<AppIntroScreen> {
  var sharePreference = locator<SharedPreferenceHelper>();
  var provider = locator<AppIntroProvider>();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    provider.getAppIntroItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => provider,
        child: Consumer<AppIntroProvider>(
          builder: (context, appInfoProvider, child) => appInfoProvider
                      .appIntroItemsDao ==
                  null
              ? Container(
                  color: Colors.transparent,
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
                          controller: pageController,
                          onPageChanged: (page) =>
                              provider.changeCurrentPageIndex(page.toDouble()),
                          children: appInfoProvider
                              .appIntroItemsDao!.introItems!
                              .map((popularMovie) => SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Center(
                                      child: NormalTextWidget(
                                          "${popularMovie.title}"))))
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
                            maintainState: true,
                            maintainAnimation: true,
                            maintainSize: true,
                            child: ClickableWireItem(
                              color: Colors.grey,
                              onPress: () => onTapChange(-1),
                            ),
                          ),
                          Expanded(
                            child: DotsIndicator(
                              dotsCount: appInfoProvider
                                  .appIntroItemsDao!.introItems!.length,
                              position: provider.currentPageIndex,
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeSize: const Size(18.0, 9.0),
                                spacing: const EdgeInsets.symmetric(
                                    horizontal: MARGIN_SMALL),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(MARGIN_MEDIUM)),
                              ),
                            ),
                          ),
                          (provider.currentPageIndex ==
                                  appInfoProvider.appIntroItemsDao!.introItems!
                                          .length -
                                      1)
                              ? ClickableWireItem(
                                  color: Colors.lightGreen,
                                  onPress: () => onTapDone(),
                                )
                              : ClickableWireItem(
                                  color: Colors.grey,
                                  onPress: () => onTapChange(1),
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

  onTapChange(int controlPage) {
    double indexMoveTo = provider.currentPageIndex + controlPage;
    if (indexMoveTo > provider.appIntroItemsDao!.introItems!.length ||
        indexMoveTo < 0) return;
    provider.changeCurrentPageIndex(indexMoveTo);
    pageController.animateToPage(provider.currentPageIndex.toInt(),
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  onTapDone() {
    sharePreference.setBool(Preferences.is_first_time_open, false);
    Navigator.pushNamed(context, 'home');
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

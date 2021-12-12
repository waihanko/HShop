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

  @override
  void initState()  {
    var provider = Provider.of<AppIntroProvider>(context, listen: false);
    provider.getAppIntroItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.height * 0.1 - MediaQuery.of(context).padding.top,
                  child:  TextButton(
                    child: const NormalTextWidget('Skip'),
                    onPressed: () {
                      print('Pressed');
                    }
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
              ],
            ),

            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cable),
        onPressed: ()=> themeProvider.switchTheme() ,
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

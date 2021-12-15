import 'package:flutter/material.dart';

class ShopProfileProvider with ChangeNotifier {
  double expandedHeight = 0;
  double toolBarHeight = 0;
  double statusBarHeight = 0;
  double collapsePercent = 100;
  double dynamicProfileSize = 80;

  void getCollapsePercent(double dynamicCollapseHeight) async {
    collapsePercent =
        ((dynamicCollapseHeight - toolBarHeight - statusBarHeight) /
                (expandedHeight - statusBarHeight)) *
            100;
    dynamicProfileSize =  (collapsePercent / 100) * 80;

    notifyListeners();
  }

  void getProfileSize(double profileSize) {
    dynamicProfileSize =  (collapsePercent / 100) * profileSize;
    notifyListeners();
  }
}

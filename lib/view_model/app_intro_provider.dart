import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_source/repository.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class AppIntroProvider with ChangeNotifier {
  var repository = locator<RepositoryImpl>();

  AppIntroItemsDao? appIntroItemsDao;
  double currentPageIndex = 0;

  Future<void> getAppIntroItems() async {
    try {
      appIntroItemsDao = await repository.getLocalAppIntroList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  void changeCurrentPageIndex(double pageIndex) {
    currentPageIndex = pageIndex;
    notifyListeners();
  }
}

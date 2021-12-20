import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_source/repository.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class AppIntroProvider with ChangeNotifier {
  var repository = locator<RepositoryImpl>();

  AppIntroItemsDao? _appIntroItemsDao;
  double _currentPageIndex = 0;

  Future<void> getAppIntroItems() async {
    try {
      _appIntroItemsDao = await repository.getLocalAppIntroList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  void changeCurrentPageIndex(double pageIndex) {
    _currentPageIndex = pageIndex;
    notifyListeners();
  }

  double get currentPageIndex => _currentPageIndex;

  AppIntroItemsDao? get appIntroItemsDao => _appIntroItemsDao;

}

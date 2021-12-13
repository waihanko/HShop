import 'package:flutter/material.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_source/repository.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class AppIntroProvider with ChangeNotifier {
  Repository repository = RepositoryImpl();
  AppIntroItemsDao? appIntroItemsDao;
  double currentPageIndex = 0;

  Future<void> getAppIntroItems() async {
    try {
      appIntroItemsDao = await repository.getLocalAppIntroList();
      notifyListeners();
      print("Data is");
      print(appIntroItemsDao!.introItems!.length);
    } catch (_) {
      rethrow;
    }
  }

  void changeCurrentPageIndex(double pageIndex){
    currentPageIndex = pageIndex;
    notifyListeners();
  }

}

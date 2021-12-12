import 'package:flutter/material.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_source/repository.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class AppIntroProvider with ChangeNotifier {
  Repository repository = RepositoryImpl();
  late AppIntroItemsDao appIntroItemsDao;

  Future<void> getAppIntroItems() async {
    try {
      repository
          .getLocalAppIntroList()
          .then((value) => {appIntroItemsDao = value}
      );
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}

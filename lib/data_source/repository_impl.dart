import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_source/repository.dart';

class RepositoryImpl extends Repository {

  @override
  Future<AppIntroItemsDao> getLocalAppIntroList() async {
    //check network
    final String response = await rootBundle.loadString('assets/local_datas/intro_sliders.json');
    var data = json.decode(response);
    return AppIntroItemsDao.fromJson(data);
  }
}

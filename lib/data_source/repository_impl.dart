import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_models/daos/product_list_dao.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/data_source/repository.dart';

class RepositoryImpl extends Repository {

  @override
  Future<AppIntroItemsDao> getLocalAppIntroList() async {
    //check network
    final String response = await rootBundle.loadString('assets/local_datas/intro_sliders.json');
    var data = json.decode(response);
    return AppIntroItemsDao.fromJson(data);
  }

  @override
  Future<ShopProfileDao> getShopProfile() async {
    //check network
    final String response = await rootBundle.loadString('assets/local_datas/shop_profile.json');
    var data = json.decode(response);
    return ShopProfileDao.fromJson(data);
  }

  @override
  Future<ProductListDao> getProductList() async{
    //check network
    final String response = await rootBundle.loadString('assets/local_datas/product_list.json');
    var data = json.decode(response);
    return ProductListDao.fromJson(data);
  }
}

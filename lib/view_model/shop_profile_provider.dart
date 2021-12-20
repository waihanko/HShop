import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/product_list_dao.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class ShopProfileProvider with ChangeNotifier {
  var repository = locator<RepositoryImpl>();

  ShopProfileDao? _shopProfileDao;
  ProductListDao? _productListDao;
  Color? _tempBgColor;

  ShopProfileDao? get shopProfileDao => _shopProfileDao;
  ProductListDao? get productListDao => _productListDao;
  Color? get tempBgColor => _tempBgColor;

  void setTempColor(Color color){
  _tempBgColor = color;
   notifyListeners();
  }

  Future<void> getShopProfile() async {
    try {
      _shopProfileDao = await repository.getShopProfile();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getProductList() async {
    try {
      _productListDao = await repository.getProductList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

}

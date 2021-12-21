import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/category_list_dao.dart';
import 'package:h_shop/data_models/daos/product_list_dao.dart';
import 'package:h_shop/data_models/daos/review_list_dao.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/data_source/repository_impl.dart';

class ShopProfileProvider with ChangeNotifier {
  var repository = locator<RepositoryImpl>();

  ShopProfileDao? _shopProfileDao;
  ProductListDao? _productListDao;
  ReviewListDao? _reviewListDao;
  CategoryListDao? _categoryListDao;

  ShopProfileDao? get shopProfileDao => _shopProfileDao;
  ProductListDao? get productListDao => _productListDao;
  ReviewListDao? get reviewListDao => _reviewListDao;
  CategoryListDao? get categoryListDao => _categoryListDao;

  Future<void> getShopProfile() async {
    try {
      _shopProfileDao = await repository.getShopProfile();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getProductList(int categoryId) async {
    try {
      _productListDao = await repository.getProductList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getReviewList(int shopId) async {
    try {
      _reviewListDao = await repository.getReviewList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getCategoryList(int shopId) async {
    try {
      _categoryListDao = await repository.getCategoryList();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

}

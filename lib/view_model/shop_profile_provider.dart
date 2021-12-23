import 'dart:math';

import 'package:flutter/material.dart';
import 'package:h_shop/app_utils/locator.dart';
import 'package:h_shop/data_models/daos/category_list_dao.dart';
import 'package:h_shop/data_models/daos/product_list_dao.dart';
import 'package:h_shop/data_models/daos/review_list_dao.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';
import 'package:h_shop/data_source/repository_impl.dart';
import 'package:collection/collection.dart';

class ShopProfileProvider with ChangeNotifier {
  var repository = locator<RepositoryImpl>();

  int _totalQtyInCart = 0;
  ShopProfileDao? _shopProfileDao;
  ProductListDao? _productListDao;
  ReviewListDao? _reviewListDao;
  CategoryListDao? _categoryListDao;
  final List<CartProduct> _cardProduct = [];

  ShopProfileDao? get shopProfileDao => _shopProfileDao;

  ProductListDao? get productListDao => _productListDao;

  ReviewListDao? get reviewListDao => _reviewListDao;

  CategoryListDao? get categoryListDao => _categoryListDao;

  List<CartProduct>? get cardProduct => _cardProduct;

  int? get totalQtyInCart => _totalQtyInCart;

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

  Future<void> handleCartItemQuantity(Products item, {int qty = 1}) async {
    _totalQtyInCart =0;
    CartProduct? alreadyAddedItem = _cardProduct.firstWhereOrNull(
        (cardProductItem) => cardProductItem.item.id == item.id);

    if (alreadyAddedItem != null) {
      CartProduct calculatedItem = CartProduct(
          item: alreadyAddedItem.item,
          totalQuantity: alreadyAddedItem.totalQuantity + qty);
      _cardProduct[_cardProduct.indexOf(alreadyAddedItem)] = calculatedItem;
    } else {
      CartProduct calculatedItem = CartProduct(item: item, totalQuantity: qty);
      _cardProduct.add(calculatedItem);
    }
    for (var element in _cardProduct) {
      _totalQtyInCart += element.totalQuantity;
    }
    notifyListeners();
  }

  Future<void> removeFromCartItem(Products item) async {
    try {
      // cardItems.removeWhere((element) => element.id == item.id);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  void calculate() {}
}

class CartProduct {
  Products? _item;
  int? _totalQuantity;
  double? _totalAmount;
  double? _totalDiscount;
  double? _netAmount;

  CartProduct({
    Products? item,
    int? totalQuantity,
  }) {
    _item = item;
    _totalQuantity = totalQuantity;
    _totalDiscount = calculateDiscount();
    _totalAmount = calculateTotalAmount();
    _netAmount = calculateNetAmount();
  }

  double? calculateDiscount() {
    return 100.0 * _totalQuantity!;
  }

  double? calculateTotalAmount() {
    return 1000;
  }

  double? calculateNetAmount() {
    return 500;
  }

  double get netAmount => _netAmount!;

  double get totalDiscount => _totalDiscount!;

  double get totalAmount => _totalAmount!;

  int get totalQuantity => _totalQuantity!;

  Products get item => _item!;
}

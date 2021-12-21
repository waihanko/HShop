import 'package:h_shop/data_models/daos/app_intro_dao.dart';
import 'package:h_shop/data_models/daos/category_list_dao.dart';
import 'package:h_shop/data_models/daos/product_list_dao.dart';
import 'package:h_shop/data_models/daos/review_list_dao.dart';
import 'package:h_shop/data_models/daos/shop_profile_dao.dart';

abstract class Repository{
  //Local
  Future<AppIntroItemsDao> getLocalAppIntroList();
  Future<ShopProfileDao> getShopProfile();
  Future<ProductListDao> getProductList();
  Future<ReviewListDao> getReviewList();
  Future<CategoryListDao> getCategoryList();
}
import 'package:h_shop/data_models/daos/app_intro_dao.dart';

abstract class Repository{

  //Local
  Future<AppIntroItemsDao> getLocalAppIntroList();

}
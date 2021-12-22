/// profile : {"id":1000,"profileImageUrl":"assets/images/intro1.png","ratingPoint":1,"shopName":"Han Gyi Production","messageBoxId":"MB-8907576799","contactNumber":["09-123234244","09-123234245","09-123234145"]}
/// categories : [{"id":1,"categoryName":"Products"},{"id":2,"categoryName":"Newest"},{"id":3,"categoryName":"Popular"},{"id":4,"categoryName":"Category"},{"id":5,"categoryName":"Review"}]

class ShopProfileDao {
  ShopProfileDao({
      Profile? profile, 
      List<Categories>? categories,}){
    _profile = profile;
    _categories = categories;
}

  ShopProfileDao.fromJson(dynamic json) {
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  Profile? _profile;
  List<Categories>? _categories;

  Profile? get profile => _profile;
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// categoryName : "Products"

class Categories {
  Categories({
      int? id, 
      String? categoryName,}){
    _id = id;
    _categoryName = categoryName;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
  }
  int? _id;
  String? _categoryName;

  int? get id => _id;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    return map;
  }

}

/// id : 1000
/// profileImageUrl : "assets/images/intro1.png"
/// ratingPoint : 1
/// shopName : "Han Gyi Production"
/// messageBoxId : "MB-8907576799"
/// contactNumber : ["09-123234244","09-123234245","09-123234145"]

class Profile {
  Profile({
      int? id, 
      String? profileImageUrl, 
      int? ratingPoint, 
      String? shopName, 
      String? messageBoxId, 
      List<String>? contactNumber,}){
    _id = id;
    _profileImageUrl = profileImageUrl;
    _ratingPoint = ratingPoint;
    _shopName = shopName;
    _messageBoxId = messageBoxId;
    _contactNumber = contactNumber;
}

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _profileImageUrl = json['profileImageUrl'];
    _ratingPoint = json['ratingPoint'];
    _shopName = json['shopName'];
    _messageBoxId = json['messageBoxId'];
    _contactNumber = json['contactNumber'] != null ? json['contactNumber'].cast<String>() : [];
  }
  int? _id;
  String? _profileImageUrl;
  int? _ratingPoint;
  String? _shopName;
  String? _messageBoxId;
  List<String>? _contactNumber;

  int? get id => _id;
  String? get profileImageUrl => _profileImageUrl;
  int? get ratingPoint => _ratingPoint;
  String? get shopName => _shopName;
  String? get messageBoxId => _messageBoxId;
  List<String>? get contactNumber => _contactNumber;


  set setShopName(String value) {
    _shopName = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profileImageUrl'] = _profileImageUrl;
    map['ratingPoint'] = _ratingPoint;
    map['shopName'] = _shopName;
    map['messageBoxId'] = _messageBoxId;
    map['contactNumber'] = _contactNumber;
    return map;
  }

}
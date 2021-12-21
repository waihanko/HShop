/// categories : [{"id":1,"categoryName":"Mobile Phone","categoryImageUrl":"https://profileUrl1"},{"id":2,"categoryName":"Electronic","categoryImageUrl":"https://profileUrl1"},{"id":3,"categoryName":"TV","categoryImageUrl":"https://profileUrl1"},{"id":4,"categoryName":"Earphone","categoryImageUrl":"https://profileUrl1"},{"id":5,"categoryName":"Power Bank","categoryImageUrl":"https://profileUrl1"},null]

class CategoryListDao {
  CategoryListDao({
      List<Categories>? categories,}){
    _categories = categories;
}

  CategoryListDao.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? _categories;

  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// categoryName : "Mobile Phone"
/// categoryImageUrl : "https://profileUrl1"

class Categories {
  Categories({
      int? id, 
      String? categoryName, 
      String? categoryImageUrl,}){
    _id = id;
    _categoryName = categoryName;
    _categoryImageUrl = categoryImageUrl;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
    _categoryImageUrl = json['categoryImageUrl'];
  }
  int? _id;
  String? _categoryName;
  String? _categoryImageUrl;

  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryImageUrl => _categoryImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryImageUrl'] = _categoryImageUrl;
    return map;
  }

}
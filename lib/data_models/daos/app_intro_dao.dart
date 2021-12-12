/// introItems : [{"imageUrl":"assets/images/intro1.png","title":"Item 1","description":"Description 1"},{"imageUrl":"assets/images/intro2.png","title":"Item 2","description":"Description 2"},{"imageUrl":"assets/images/intro3.png","title":"Item 3","description":"Description 3"}]

class AppIntroItemsDao {
  List<IntroItems>? _introItems;

  List<IntroItems>? get introItems => _introItems;

  AppIntroItemsDao({
      List<IntroItems>? introItems}){
    _introItems = introItems;
}

  AppIntroItemsDao.fromJson(dynamic json) {
    if (json['introItems'] != null) {
      _introItems = [];
      json['introItems'].forEach((v) {
        _introItems?.add(IntroItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_introItems != null) {
      map['introItems'] = _introItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imageUrl : "assets/images/intro1.png"
/// title : "Item 1"
/// description : "Description 1"

class IntroItems {
  String? _imageUrl;
  String? _title;
  String? _description;

  String? get imageUrl => _imageUrl;
  String? get title => _title;
  String? get description => _description;

  IntroItems({
      String? imageUrl, 
      String? title, 
      String? description}){
    _imageUrl = imageUrl;
    _title = title;
    _description = description;
}

  IntroItems.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}
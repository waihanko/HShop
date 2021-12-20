/// products : [{"id":1,"productName":"Xaomi MI9SE","ProductImageUrl":"Products","price":1000,"discountPercent":50},{"id":2,"productName":"Xaomi MI10","ProductImageUrl":"Newest","price":1000,"discountPercent":50},{"id":3,"productName":"Xaomi Book","ProductImageUrl":"Popular","price":1000,"discountPercent":50},{"id":4,"productName":"Category","ProductImageUrl":"Category","price":1000,"discountPercent":50},{"id":5,"productName":"Review","ProductImageUrl":"Review","price":1000,"discountPercent":50}]

class ProductListDao {
  ProductListDao({
      List<Products>? products,}){
    _products = products;
}

  ProductListDao.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? _products;

  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// productName : "Xaomi MI9SE"
/// ProductImageUrl : "Products"
/// price : 1000
/// discountPercent : 50

class Products {
  Products({
      int? id, 
      String? productName, 
      String? productImageUrl, 
      int? price, 
      int? discountPercent,}){
    _id = id;
    _productName = productName;
    _productImageUrl = productImageUrl;
    _price = price;
    _discountPercent = discountPercent;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['productName'];
    _productImageUrl = json['ProductImageUrl'];
    _price = json['price'];
    _discountPercent = json['discountPercent'];
  }
  int? _id;
  String? _productName;
  String? _productImageUrl;
  int? _price;
  int? _discountPercent;

  int? get id => _id;
  String? get productName => _productName;
  String? get productImageUrl => _productImageUrl;
  int? get price => _price;
  int? get discountPercent => _discountPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['productName'] = _productName;
    map['ProductImageUrl'] = _productImageUrl;
    map['price'] = _price;
    map['discountPercent'] = _discountPercent;
    return map;
  }

}
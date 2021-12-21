/// reviews : [{"id":1,"reviewPoint":1,"review":"Cheap Price","reviewImageList":["https://imageUrl1","https://imageUrl2"],"user":{"profileUrl":"https://profileUrl1","name":"Wai Han Ko"}},{"id":2,"reviewPoint":1,"review":"Good","reviewImageList":["https://imageUrl1","https://imageUrl2"],"user":{"profileUrl":"https://profileUrl1","name":"Ko Aung"}},{"id":3,"reviewPoint":5,"review":"Cheap Price","reviewImageList":["https://imageUrl1","https://imageUrl2"],"user":{"profileUrl":"https://profileUrl1","name":"Maung Mya"}},{"id":4,"reviewPoint":3,"review":"Cheap Price","reviewImageList":["https://imageUrl1","https://imageUrl2"],"user":{"profileUrl":"https://profileUrl1","name":"Ma Khin Hnin Si"}},{"id":5,"reviewPoint":1,"review":"Bad Service","reviewImageList":["https://imageUrl1","https://imageUrl2"],"user":{"profileUrl":"https://profileUrl1","name":"Wai Han Ko"}}]

class ReviewListDao {
  ReviewListDao({
      List<Reviews>? reviews,}){
    _reviews = reviews;
}

  ReviewListDao.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
  }
  List<Reviews>? _reviews;

  List<Reviews>? get reviews => _reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// reviewPoint : 1
/// review : "Cheap Price"
/// reviewImageList : ["https://imageUrl1","https://imageUrl2"]
/// user : {"profileUrl":"https://profileUrl1","name":"Wai Han Ko"}

class Reviews {
  Reviews({
      int? id, 
      int? reviewPoint, 
      String? review, 
      List<String>? reviewImageList, 
      User? user,}){
    _id = id;
    _reviewPoint = reviewPoint;
    _review = review;
    _reviewImageList = reviewImageList;
    _user = user;
}

  Reviews.fromJson(dynamic json) {
    _id = json['id'];
    _reviewPoint = json['reviewPoint'];
    _review = json['review'];
    _reviewImageList = json['reviewImageList'] != null ? json['reviewImageList'].cast<String>() : [];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? _id;
  int? _reviewPoint;
  String? _review;
  List<String>? _reviewImageList;
  User? _user;

  int? get id => _id;
  int? get reviewPoint => _reviewPoint;
  String? get review => _review;
  List<String>? get reviewImageList => _reviewImageList;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reviewPoint'] = _reviewPoint;
    map['review'] = _review;
    map['reviewImageList'] = _reviewImageList;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// profileUrl : "https://profileUrl1"
/// name : "Wai Han Ko"

class User {
  User({
      String? profileUrl, 
      String? name,}){
    _profileUrl = profileUrl;
    _name = name;
}

  User.fromJson(dynamic json) {
    _profileUrl = json['profileUrl'];
    _name = json['name'];
  }
  String? _profileUrl;
  String? _name;

  String? get profileUrl => _profileUrl;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profileUrl'] = _profileUrl;
    map['name'] = _name;
    return map;
  }

}
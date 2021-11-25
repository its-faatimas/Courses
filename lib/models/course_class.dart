import 'dart:convert';

class Course {
  String? id;
  String? title;
  String? img;
  String? level;
  int? percent;
  int? numLes;
  String? author;
  String? categoryId;

  Course(
      this.id,
      this.title,
      this.img,
      this.level,
      this.percent,
      this.numLes,
      this.author,
      this.categoryId);

  Course.map(
      {this.id,
      this.title,
      this.img,
      this.level,
      this.percent,
      this.numLes,
      this.author,
      this.categoryId});

  // Course(this._title, this._img, this._level, this._percent, this._numLes,
  //     this._author, this._categoryId);

  // Map<String, dynamic> toMap() {
  //   return {
  //     '_title': _title,
  //     '_img': _img,
  //     '_level': _level,
  //     '_percent': _percent,
  //     '_numLes': _numLes,
  //     '_author': _author,
  //     '_categoryId': _categoryId,
  //   };
  // }

  // factory Course.fromMap(Map<String, dynamic> map) {
  //   return Course(
  //     map['_title'] != null ? map['_title'] : null,
  //     map['_img'] != null ? map['_img'] : null,
  //     map['_level'] != null ? map['_level'] : null,
  //     map['_percent'] != null ? map['_percent'] : null,
  //     map['_numLes'] != null ? map['_numLes'] : null,
  //     map['_author'] != null ? map['_author'] : null,
  //     map['_categoryId'] != null ? map['_categoryId'] : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'img': img,
      'level': level,
      'percent': percent,
      'numLes': numLes,
      'author': author,
      'categoryId': categoryId,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course.map(
      id: map['id'] != null ? map['id'] : null,
      title: map['title'] != null ? map['title'] : null,
      img: map['img'] != null ? map['img'] : null,
      level: map['level'] != null ? map['level'] : null,
      percent: map['percent'] != null ? map['percent'] : null,
      numLes: map['numLes'] != null ? map['numLes'] : null,
      author: map['author'] != null ? map['author'] : null,
      categoryId: map['categoryId'] != null ? map['categoryId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}

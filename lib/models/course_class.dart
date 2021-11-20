import 'dart:convert';

class Course {
  String? _title;
  String? _img;
  String? _level;
  String? _percent;
  int? _numLes;
  String? _author;
  String? _categoryId;

  Course(this._title, this._img, this._level, this._percent, this._numLes,
      this._author, this._categoryId);

      

  Map<String, dynamic> toMap() {
    return {
      '_title': _title,
      '_img': _img,
      '_level': _level,
      '_percent': _percent,
      '_numLes': _numLes,
      '_author': _author,
      '_categoryId': _categoryId,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      map['_title'] != null ? map['_title'] : null,
      map['_img'] != null ? map['_img'] : null,
      map['_level'] != null ? map['_level'] : null,
      map['_percent'] != null ? map['_percent'] : null,
      map['_numLes'] != null ? map['_numLes'] : null,
      map['_author'] != null ? map['_author'] : null,
      map['_categoryId'] != null ? map['_categoryId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}

import 'dart:convert';

class Category {
  String? _id;
  String? _imgUrl;
  String? _title;

  Category(this._id, this._imgUrl, this._title);

  String get id => _id!;
  String get imgUrl => _imgUrl!;
  String get title => _title!;

  Map<String, dynamic> toMap() {
    return {
      '_id': _id,
      '_imgUrl': _imgUrl,
      '_title': _title,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['_id'] != null ? map['_id'] : null,
      map['_imgUrl'] != null ? map['_imgUrl'] : null,
      map['_title'] != null ? map['_title'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));
}

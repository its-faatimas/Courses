import 'dart:convert';

class Video {
  String? _title;
  int? _duration;
  String? _description;
  String? _courseId;

  Video(this._title, this._duration, this._description, this._courseId);


  

  Map<String, dynamic> toMap() {
    return {
      '_title': _title,
      '_duration': _duration,
      '_description': _description,
      '_courseId': _courseId,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      map['_title'] != null ? map['_title'] : null,
      map['_duration'] != null ? map['_duration'] : null,
      map['_description'] != null ? map['_description'] : null,
      map['_courseId'] != null ? map['_courseId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));
}

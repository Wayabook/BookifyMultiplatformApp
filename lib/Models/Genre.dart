
class Genre {
  String _id;
  String _name;
  String _picture;

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get picture => _picture;

  set picture(String picture) {
    _picture = picture;
  }

  Genre(this._id, this._name, this._picture);
}
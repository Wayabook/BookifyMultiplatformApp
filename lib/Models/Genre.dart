
class Genre {
  String _id;
  String _name;
  String _picture;

  Genre(this._id, this._name, this._picture);

  Genre.withoutId(this._name, this._picture);

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  
  
  static List<Genre> getMockGenres(){
    List<Genre> genres = List();
    genres.add(Genre("1", "Genre1", "genre1.png"));
    genres.add(Genre("2", "Genre2", "genre2.png"));
    genres.add(Genre("3", "Genre3", "genre3.png"));
    genres.add(Genre("4", "Genre4", "genre4.png"));
    genres.add(Genre("5", "Genre5", "genre5.png"));
    genres.add(Genre("6", "Genre6", "genre6.png"));
    genres.add(Genre("7", "Genre7", "genre7.png"));
    genres.add(Genre("8", "Genre8", "genre8.png"));
    genres.add(Genre("9", "Genre9", "genre9.png"));
    return genres;
  }

  @override
  bool operator ==(other) {
    return (other.id == id && other.name == name);
  }
}
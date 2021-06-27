class Genre {
  String _id;
  String _name;
  String _picture;

  Genre(this._id, this._name, this._picture);

  Genre.withoutId(this._name, this._picture);

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  static List<Genre> getMockGenres() {
    List<Genre> genres = List();
    genres.add(Genre("1", "Poesía", "genre1.png"));
    genres.add(Genre("2", "Técnicos", "genre2.png"));
    genres.add(Genre("3", "Sociología", "genre3.png"));
    genres.add(Genre("4", "Educación", "genre4.png"));
    genres.add(Genre("5", "Clásicos", "genre5.png"));
    genres.add(Genre("6", "Biología", "genre6.png"));
    genres.add(Genre("7", "Romántica", "genre7.png"));
    genres.add(Genre("8", "Fanatsía", "genre8.png"));
    genres.add(Genre("9", "Aventuras", "genre9.png"));
    return genres;
  }

  @override
  bool operator ==(other) {
    return (other.id == id && other.name == name);
  }
}

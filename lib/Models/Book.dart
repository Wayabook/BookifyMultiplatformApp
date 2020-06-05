
class Book {

  String _title;
  String _author;
  String _coverImage;
  String _summary;
  bool _read;
  int _year;
  int _extension;
  String _isbn;
  int _sumRatings;
  int _numRatings;
  bool _isNew;

  //ArrayList<Emoji> emojis;
  //Calendar calendar;
  //Genre genre;
  //Author auth;
  //ArrayList<Review> comments;
  //private ArrayList<Review>

  String get title => _title;

  set title(String title) {
    _title = title;
  }

  String get author => _author;

  set author(String author) {
    _author = author;
  }

  String get picture => _coverImage;

  set picture(String picture) {
    _coverImage = picture;
  }

  String get summary => _summary;

  set summary(String summary) {
    _summary = summary;
  }

  bool get read => _read;

  set read(bool read) {
    _read = read;
  }

  int get year => _year;

  set year(int year) {
    _year = year;
  }

  int get extension => _extension;

  set extension(int extension) {
    _extension = extension;
  }

  String get isbn => _isbn;

  set isbn(String id) {
    _isbn = id;
  }

  int get sumRatings => _sumRatings;

  set sumRatings(int sumRatings) {
    _sumRatings = sumRatings;
  }

  int get numRatings => _numRatings;

  set numRatings(int numRatings) {
    _numRatings = numRatings;
  }

  bool get isNew => _isNew;

  set isNew(bool isNew) {
    _isNew = isNew;
  }

  Book(this._title, this._author, this._coverImage);





}
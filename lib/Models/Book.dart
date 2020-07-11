import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Item.dart';

class Book {

  String _title;
  String _author;
  String _coverImage;
  String _summary;
  bool _read; //NO
  int _year;
  int _extension;
  String _isbn;
  String _ean;
  String editorial;
  String language;
  int _sumRatings;
  int _numRatings;
  bool _isNew;
  List<User> _friends_reading;
  Map<String, List<Item>> _shops_items;

  //ArrayList<Emoji> emojis;
  //Calendar calendar;
  //Genre genre;
  //Author auth;
  //ArrayList<Review> comments;
  //private ArrayList<Review>

  Book(this._title, this._author, this._coverImage);

  Book.withSummary(this._title, this._author, this._coverImage, this._summary, this._isbn, this._ean, this._shops_items, {this.editorial="SUMA", this.language="CASTELLANO"});

  List<User> get friends_reading => _friends_reading;

  set friends_reading(List<User> fr) {
    _friends_reading = fr;
  }

  Map<String, List<Item>> get shops_items => _shops_items;

  set shops_items(Map<String, List<Item>> fr) {
    _shops_items = fr;
  }

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

  String get ean => _ean;

  set ean(String ean) {
    _ean = ean;
  }

  /*String get language => language;

  set ean(String ean) {
    _ean = ean;
  }*/

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

  @override
  bool operator ==( other) {
    if(this._isbn ==  other.isbn)
      return true;
    return false;
    // TODO: implement ==
    //return super this==(other);
  }





}
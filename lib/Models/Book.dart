import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Item.dart';

class Book {

  String _title;
  String _author;
  String _coverImage;
  String _summary;
  int _year;
  int _extension;
  String _isbn;
  String _ean;
  String editorial;
  String language;
  int addedBy;
  //int sumRatings;
  //int numRatings;

  double avgRating;
  bool isNew;
  //List<String> chaptersTitles;
  List<Chapter> chapters;
  List<User> friends_reading; /*Canviar i ficar al lecture ?*/
  Map<String, List<Item>> _shops_items;

  //ArrayList<Emoji> emojis;
  //Calendar calendar;
  //Genre genre;
  //Author auth;
  //ArrayList<Review> comments;
  //private ArrayList<Review>

  //Book();

  Book(
      this._title,
      this._author,
      this._coverImage,
      this._summary,
      this._year,
      this._extension,
      this._isbn,
      this._ean,
      this._shops_items,
      this.editorial,
      this.language,
      {
        this.avgRating,
        this.isNew = false,
        this.addedBy = 2049,
        this.chapters = const [],
        this.friends_reading = const [],
      }
    );

  Book.withSummary(
      this._title,
      this._author,
      this._coverImage,
      this._summary,
      this._isbn,
      this._ean,
      this._shops_items,
      {this.editorial="SUMA", this.language="CASTELLANO", this.chapters = const []});

  Lecture toLecture({int currentChapter = 0}){
    return new Lecture(
        this.title,
        this.author,
        this._coverImage,
        this.summary,
        this.year,
        this.extension,
        this.isbn,
        this.ean,
        this.shops_items,
        this.editorial,
        this.language,
        this.addedBy,
        avgRating: this.avgRating,
        isNew: this.isNew,
        chapters: this.chapters,
        friends_reading: this.friends_reading,
        currentChapter: currentChapter
    );
  }

  static List<Lecture>  toLectureList(List<Book> books){
    List<Lecture> lectures = new List();
    for(Book book in books)
      lectures.add(book.toLecture());
    return lectures;

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

  int get addedByNumberOfPeople => addedBy;

  set addedByNumberOfPeople(int addedByNumberOfPeople) {
    addedByNumberOfPeople = addedByNumberOfPeople;
  }

  List<Chapter> get chapterTitlesList => chapters;

  set chapterTitlesList(List<Chapter> chapterTitlesList) {
    this.chapters = chapterTitlesList;
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
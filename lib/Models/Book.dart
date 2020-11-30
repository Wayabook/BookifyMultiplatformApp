import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Item.dart';

import 'Genre.dart';

class Book {
  String _title;
  String _author;
  String _coverImage;
  String _summary;
  int _year;
  int _extension;
  String editorial;
  String language;
  int addedBy;
  double avgRating;
  bool isNew;
  List<Chapter> chapters;
  List<User> friends_reading;
  Map<String, List<Item>> _shops_items;
  Genre _mainGenre;

  Book(
      this._title,
      this._author,
      this._coverImage,
      this._summary,
      this._mainGenre,
      this._year,
      this._extension,
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
      this._mainGenre,
      this._shops_items,
      {
        this.editorial="SUMA",
        this.language="CASTELLANO",
        this.chapters = const [],
        this.friends_reading = const[],
        this.addedBy = 100
      });

  Lecture toLecture({int currentChapter = 0}){
    return new Lecture(
        this.title,
        this.author,
        this._coverImage,
        this.summary,
        this._mainGenre,
        this.year,
        this.extension,
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

  int getBookTotalNumberOfComments(){
    int comments = 0;
    for(Chapter chapter in this.chapters){
      comments += chapter.comments.length;
    }
    return comments;
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

  Genre get mainGenre => _mainGenre;

  int get year => _year;

  set year(int year) {
    _year = year;
  }

  int get extension => _extension;

  set extension(int extension) {
    _extension = extension;
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
    if(this.title ==  other.title && this.author == other.author)
      return true;
    return false;
    // TODO: implement ==
    //return super this==(other);
  }

  static List<Book> getUserMockBooks(){

    List<Book> books = new List();
    List<Item> items = Item.getMockItems();
    List<Chapter> chapters = Chapter.getMockChapters();
    List<Genre> genres = Genre.getMockGenres();
    //List<User> friends = User.getMockAlterantiveUsers();

    Map<String, List<Item>> shopItems = {
      'Tapa Blanda': items,
      'Tapa Dura' : items,
      'Tapa Ebook': items,
    };

    String description =
    """
    Engánchate al fenómenoValeria de @BetaCoqueta, una saga altamente divertida, emotiva y sensual.
    
    ¡Te vas a enamorar!
    
    Valeria es escritora de historias de amor.
    Valeria vive el amor de forma sublime.
    Valeria tiene tres amigas: Nerea, Carmen y Lola.
    Valeria vive en Madrid.
    Valeria ama a Adrián hasta que conoce a Víctor.
    Valeria necesita sincerarse consigo misma.
    Valeria llora, Valeria ríe, Valeria camina...
    Pero el sexo, el amor y los hombres no son objetivos fáciles.
    Valeria es especial.
    Como tú.
    
    En los zapatos de Valeria es el primer libro de la«Saga Valeria», la primera obra deElísabet Benavent, que inició su carrera literaria autopublicándose y que en poco tiempo conquistó a cientos de lectores y se situó en los primeros puestos de la lista de más vendidos de ficción.
    
    Posteriormente la autora, también conocida por sus fans como@BetaCoqueta, ha continuado cosechando grandes éxitos con la publicación de su«Saga Silvia», la trilogía«Mi elección», la bilogía«Horizonte Martina» y la novelaMi isla.
    """;

    Book book1 = new Book.withSummary(
        "En los Zapatos de Valeria",
        "Elisabeth Benavent",
        "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg",
        description,
        genres[0],
        shopItems,
        chapters : chapters,
        //friends_reading: friends,
    );

    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description,
        genres[1],
        shopItems,
        chapters: chapters,
        //friends_reading: friends,
    );

    Book book3 = new Book.withSummary(
        "Con el amor bastaba looooooooooooooooooooooooooooooooookasssssssssssssssssssssssoooooooooooooo looooooooooooooooooooooooooooooooookasssssssssssssssssssssssoooooooooooooo",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description,
        genres[2],
        shopItems,
        chapters: chapters,
        //friends_reading: friends,
    );

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description,
        genres[3],
        shopItems,
        chapters: chapters,
        //friends_reading: friends,
    );

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);
    return books;
  }

  static List<Book> getAppMockBooks(){
    List<Book> books = Book.getUserMockBooks();
    books[0].friends_reading = User.getMockAlterantiveUsers().sublist(0, 1);
    books[1].friends_reading = User.getMockAlterantiveUsers().sublist(0, 2);
    books[2].friends_reading = User.getMockAlterantiveUsers().sublist(0, 3);
    books[3].friends_reading = User.getMockAlterantiveUsers().sublist(0, 1);
    return books;
  }





}
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:flutter/material.dart';

import 'Chapter.dart';
import 'Item.dart';
import 'Lecture.dart';
import 'Shop.dart';

class User extends ChangeNotifier{

  String _uid;
  String _name;
  String _description_sentence;
  List<Genre> _interested_genres;
  String _profile_picture_url;
  //Map<String, List<Book>> _book_lists;
  Map<String, List<Lecture>> _lecture_lists;
  int _books_read;
  int _chapters_read;
  int _pages_read;
  List<User> _friends;
  /*List<User> _followers;
  List<User> _following;*/

  /*void addCommentToLecture(Lecture lecture, MainComment mainComment){
     int lecturePos;
    if(isInReadingList(lecture)) {
      lecturePos = this._lecture_lists["Reading"].indexOf(lecture);
      this._lecture_lists["Reading"][lecturePos]
    }
  }*/

  Map<String, List<Lecture>> get lectures => this._lecture_lists;

  set lectures(Map<String, List<Lecture>>  lectures){
    this._lecture_lists = lectures;
  }

  List<Lecture> getLectureListByName(String listName){
    if(this._lecture_lists.containsKey(listName))
      return this._lecture_lists[listName];
    return new List();
  }

  List<Lecture> getNLecturesFromBookshelf(int n){
      List<Lecture> books = new List();
      for(String key in _lecture_lists.keys){
        for(Lecture book in _lecture_lists[key]){
          if(!books.contains(book)){
            books.add(book);
          }
        }
      }
      books.shuffle();
      return n > books.length ? books : books.sublist(0, n-1);
  }

  void addLectureToPendingList(Lecture lecture){
    this._lecture_lists["Pending"].add(lecture);
    notifyListeners();
  }

  void removeLectureFromPendingList(Lecture lecture){
    this._lecture_lists["Pending"].remove(lecture);
    notifyListeners();
  }

  void addLectureToReadingList(Lecture lecture){
    this._lecture_lists["Reading"].add(lecture);
    notifyListeners();
  }

  void moveLectureFromReadingListToReadList(Lecture lecture){
    if(isInReadingList(lecture)){
      this._lecture_lists["Read"].add(lecture);
      this._lecture_lists["Reading"].remove(lecture);
      notifyListeners();
    }
  }

  void moveLectureFromPendingListToReadingList(Lecture lecture){
    if(isInPendingList(lecture)){
      this._lecture_lists["Reading"].insert(0, lecture);
      this._lecture_lists["Pending"].remove(lecture);
      //notifyListeners();
    }
  }

  void removeLectureFromReadingList(Lecture lecture){
    this._lecture_lists["Reading"].remove(lecture);
    notifyListeners();
  }

  void removeLectureFromReadingListAtPosition(int position){
    this._lecture_lists["Reading"].remove(position);
    notifyListeners();
  }

  bool isInReadingList(Lecture lecture){
    return this._lecture_lists["Reading"].contains(lecture);
  }

  bool isInPendingList(Lecture lecture){
    return this._lecture_lists["Pending"].contains(lecture);
  }
  
  void addCustomLectureList(String listName, List<Lecture> list){
    this._lecture_lists.addAll({listName : list});
  }

  /*List<Lecture> get bookshelf {
    List<Lecture> books = new List();
    for(String key in _book_lists.keys){
      for(Lecture book in _book_lists[key]){
        if(!books.contains(book)){
          books.add(book);
        }
      }
    }
    return books;
  }*/
  /*void removeLectureFromReadingList(Lecture lecture){
    this._lecture_lists["Reading"].remove(lecture);
    notifyListeners();
  }*/

  void increaseChapter(Lecture lecture){
    int position;
    if(isInReadingList(lecture)){
      lecture.increaseChapter();
      position = this._lecture_lists["Reading"].indexOf(lecture);
      if(position != 0){
        this._lecture_lists["Reading"].removeAt(position);
        this._lecture_lists["Reading"].insert(0, lecture);
      }
    } else if (isInPendingList(lecture)) {
      position = _lecture_lists["Pending"].indexOf(lecture);
      this._lecture_lists["Pending"][position].increaseChapter();
      if(this._lecture_lists["Pending"][position].currentChapter == 1){
        moveLectureFromPendingListToReadingList(this._lecture_lists["Pending"][position]);
      }

    }
    notifyListeners();
  }

  List<Book> get bookshelf {
    List<Book> books = new List();
    for(String key in _lecture_lists.keys){
      for(Book book in _lecture_lists[key]){
        if(!books.contains(book)){
          books.add(book);
        }
      }
    }
    return books;
  }

  List<User> get friends => this._friends;
  set friends(List<User> friends) {
    _friends = friends;
  }

  /*List<User> get following => this._following;
  set following(List<User> followers) {
    _following = followers;
  }*/

  bool isEqual(User user){
    return this._uid == user._uid;
  }

  int get pagesRead => _pages_read;

  set pagesRead(int pagesRead) {
    _pages_read = pagesRead;
  }

  int get chaptersRead => _chapters_read;

  set chaptersRead(int chaptersRead) {
    _chapters_read = chaptersRead;
  }

  int get booksRead => _books_read;

  set booksRead(int booksRead) {
    _books_read = booksRead;
  }

  List<Genre> get interestedGenres => _interested_genres;

  set interestedGenres(List<Genre> interestedGenres) {
    _interested_genres = interestedGenres;
  }

  String get descriptionSentence => _description_sentence;

  set descriptionSentence(String descriptionSentence) {
    _description_sentence = descriptionSentence;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get profilePictureUrl => _profile_picture_url;

  set profilePictureUrl(String profile_picture_url) {
    _profile_picture_url = profile_picture_url;
  }

  Map<String, List<Lecture>> get bookLists => _lecture_lists;

  set bookLists(Map<String, List<Book>> book_lists) {
    _lecture_lists = book_lists;
  }

  User(
      this._uid,
      this._name,
      this._description_sentence,
      this._interested_genres,
      this._lecture_lists,
      this._books_read,
      this._chapters_read,
      this._pages_read,
      this._profile_picture_url
      );

  User.withBookLists(this._lecture_lists);
  User.withProfilePicture(this._profile_picture_url);
  User.withNameAndProfilePicture(this._name, this._profile_picture_url);

  User.getMockUser(){

    //User user;
    List<Book> books = new List();
    List<Lecture> lectures = new List();
    List<Item> items = new List();
    List<Genre> genres = new List();

    List<Chapter> chapters = new List();
    chapters.add(new Chapter(1, "Capitulo 1 :  Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(2, "Capitulo 2 :  Post Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(3, "Capitulo 3 :  Pre Final", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(4, "Capitulo 4 :  Final", comments: MainComment.getMockMainComments()));

    Shop shop1 = new Shop.withoutIds("Casa del Libro", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
    Shop shop2 = new Shop.withoutIds("Fnac", "https://upload.wikimedia.org/wikipedia/commons/2/2e/Fnac_Logo.svg");
    Shop shop3 = new Shop.withoutIds("El corte ingles", "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg");
    Shop shop4 = new Shop.withoutIds("Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png");
    Shop shop5 = new Shop.withoutIds("Me gusta leer", "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg");

    items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€"));
    items.add(new Item.withoutId(shop2, "https://www.fnac.es/a7456973/En-busca-del-chico-irrompible#st=el+chico+irr&ct=En+todo+Fnac&t=p", 16.05, "€"));
    items.add(new Item.withoutId(shop3, "https://www.elcorteingles.es/libros/A35120735-en-busca-del-chico-irrompible-tapa-dura-9788408228059/", 16.05, "€"));
    items.add(new Item.withoutId(shop4, "https://www.tagusbooks.com/ebook-en-busca-del-chico-irrompible-ebook/9788408230663/11537354", 16.05, "€"));
    items.add(new Item.withoutId(shop5, "https://tienda.megustaleer.com/libros/2519-dulce-chico-indecente-9788490708248.html", 16.05, "€"));

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
        "1",
        "2",
        shopItems,
        chapters : chapters
    );

    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description,
        "2",
        "2",
        shopItems,
        chapters: chapters
    );

    Book book3 = new Book.withSummary(
        "Con el amor bastaba",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description,
        "3",
        "2",
        shopItems,
        chapters: chapters
    );

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description,
        "4",
        "2",
        shopItems,
        chapters: chapters
    );

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    lectures.add(book1.toLecture());
    lectures.add(book2.toLecture());
    lectures.add(book3.toLecture());
    lectures.add(book4.toLecture());

    Genre genre1 = Genre("1", "Genre1", "genre1.png");
    Genre genre2 = Genre("2", "Genre2", "genre2.png");
    Genre genre3 = Genre("3", "Genre3", "genre3.png");
    Genre genre4 = Genre("4", "Genre4", "genre4.png");
    Genre genre5 = Genre("5", "Genre5", "genre5.png");
    Genre genre6 = Genre("6", "Genre6", "genre6.png");
    Genre genre7 = Genre("7", "Genre7", "genre7.png");
    Genre genre8 = Genre("8", "Genre8", "genre8.png");
    Genre genre9 = Genre("9", "Genre9", "genre9.png");

    genres.add(genre1);
    genres.add(genre2);
    genres.add(genre3);
    genres.add(genre4);
    genres.add(genre5);
    genres.add(genre6);
    genres.add(genre7);
    genres.add(genre8);
    genres.add(genre9);


    Map<String, List<Lecture>> userLectures =
    {'Reading': lectures.sublist(0, 1), 'Pending': lectures.sublist(2, 3), 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};

    List<User> users = new List();
    User user222 = new User(
        "1",
        "Steve Jobs",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    );

    User user1 = new User(
        "1",
        "Steve Jobs 1",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    );

    User user2 = new User(
        "1",
        "Steve Jobs 2",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    );

    User user3 = new User(
        "1",
        "Steve Jobs 3",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    );

    User user4 = new User(
        "1",
        "Steve Jobs 33",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    );

    users.add(user222);
    users.add(user1);
    users.add(user2);
    users.add(user3);
    users.add(user4);

    this._uid = "1112";
    this.name = "Radu Fucking Spaimoc";
    this._description_sentence = "\"Best trollo ever\"";
    this._interested_genres = genres;
    this._lecture_lists = userLectures;
    this._books_read = 10;
    this._chapters_read = 278;
    this._pages_read = 334;
    this._profile_picture_url = "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4";
    this.friends = users;


  }


}
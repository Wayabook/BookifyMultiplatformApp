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
  Map<String, List<Lecture>> _lecture_lists;
  int _books_read;
  int _chapters_read;
  int _pages_read;
  List<User> _friends;

  bool isFriend(User user){
    return friends.contains(user);
  }

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

  bool hasLectureList(String list){
    return this.lectures.containsKey(list);
  }

  bool isLectureInList(Lecture lecture, String list){
    if(this.lectures.containsKey(list))
      return this.lectures[list].contains(lecture);
    return false;
  }

  
  void addCustomLectureList(String listName, List<Lecture> list){
    this._lecture_lists.addAll({listName : list});
    notifyListeners();
  }

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

    List<Lecture> lectures = Lecture.getUserMockLectures();
    List<Genre> genres = Genre.getMockGenres();


    Map<String, List<Lecture>> userLectures =
    {'Reading': lectures.sublist(0, 1), 'Pending': lectures.sublist(2, 3), 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};

    List<User> friends = getMockUserFriends();

    this._uid = "1112";
    this.name = "Radu Spaimovich";
    this._description_sentence = "\"Best trollo ever\"";
    this._interested_genres = genres;
    this._lecture_lists = userLectures;
    this._books_read = 10;
    this._chapters_read = 278;
    this._pages_read = 334;
    this._profile_picture_url = "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4";
    this.friends = friends;
  }

  List<User> getMockUserFriends(){

    List<User> friends = new List();
    List<Lecture> lectures = Lecture.getUserMockLectures();
    List<Genre> genres = Genre.getMockGenres();

    Map<String, List<Lecture>> userLectures =
    {'Reading': lectures.sublist(0, 1), 'Pending': lectures.sublist(2, 3), 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};

    friends.add(new User(
        "1",
        "Steve Jobs",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    ));

    friends.add(new User(
        "1",
        "Steve Jobs 1",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    ));

    friends.add(new User(
        "1",
        "Steve Jobs 2",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    ));

    friends.add( new User(
        "1",
        "Steve Jobs 3",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    ));

    friends.add(User(
        "1",
        "Steve Jobs 33",
        "\"Not as good as Steve Jobs\"",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
    ));

    return friends;
  }


}
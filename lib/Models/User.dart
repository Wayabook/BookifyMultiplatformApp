import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:flutter/material.dart';
import 'Lecture.dart';

class User extends ChangeNotifier {
  String _uid;
  String _name;
  List<Genre> _interestedGenres;
  String _profilePictureUrl;
  Map<String, List<Lecture>> _lectureLists;
  List<Recommendation> _recommendationsReceived;
  int _booksRead;
  int _chaptersRead;
  int _pagesRead;
  List<User> _friends;

  static List<String> uneditableLists() {
    return ['Reading', 'Pending', 'Read'];
  }

  List<Recommendation> get recommendationsReceived {
    if (this._recommendationsReceived == null)
      return new List<Recommendation>();
    return this._recommendationsReceived;
  }

  bool isBookRecommended(Book book) {
    List<Book> recommendedBooks =
        Recommendation.getBooksFromRecommendations(recommendationsReceived);
    return recommendedBooks.contains(book);
  }

  List<User> getBookRecommenders(Book book) {
    if (isBookRecommended(book))
      return Recommendation.getBookRecommenders(recommendationsReceived, book);
    return new List();
  }

  void addNewRecommendationsReceived(List<Recommendation> recommendations) {
    if (this._recommendationsReceived == null)
      this._recommendationsReceived = new List();
    this._recommendationsReceived.addAll(recommendations);
  }

  //set recomme

  bool isFriend(User user) {
    return friends.contains(user);
  }

  void addFriend(User user) {
    if (!this.isEqual(user)) this._friends.add(user);
  }

  void removeFriend(User user) {
    if (this._friends.contains(user)) this._friends.remove(user);
  }

  Map<String, List<Lecture>> get lectures => this._lectureLists;

  set lectures(Map<String, List<Lecture>> lectures) {
    this._lectureLists = lectures;
  }

  void removeLectureListByName(String listName) {
    if (this._lectureLists.containsKey(listName))
      this._lectureLists.remove(listName);
    notifyListeners();
  }

  List<Lecture> getLectureListByName(String listName) {
    if (this._lectureLists.containsKey(listName))
      return this._lectureLists[listName];
    return new List();
  }

  List<Lecture> getNLecturesFromBookshelf(int n) {
    List<Lecture> books = new List();
    for (String key in _lectureLists.keys) {
      for (Lecture book in _lectureLists[key]) {
        if (!books.contains(book)) {
          books.add(book);
        }
      }
    }
    books.shuffle();
    return n > books.length ? books : books.sublist(0, n - 1);
  }

  void addLectureToLectureListByKey(Lecture lecture, String lectureName) {
    if (this._lectureLists.containsKey(lectureName))
      this._lectureLists[lectureName].add(lecture);
  }

  void addListOfLecturesToLectureListByKey(
      List<Lecture> lectures, String lectureName) {
    if (this._lectureLists.containsKey(lectureName))
      this._lectureLists[lectureName].addAll(lectures);
  }

  void removeLectureFromLectureListByKey(Lecture lecture, String lectureName) {
    if (this._lectureLists.containsKey(lectureName))
      this._lectureLists[lectureName].remove(lecture);
  }

  void addLectureToPendingList(Lecture lecture) {
    this._lectureLists["Pending"].add(lecture);
    notifyListeners();
  }

  void removeLectureFromPendingList(Lecture lecture) {
    this._lectureLists["Pending"].remove(lecture);
    notifyListeners();
  }

  void addLectureToReadingList(Lecture lecture) {
    this._lectureLists["Reading"].add(lecture);
    notifyListeners();
  }

  void moveLectureFromReadingListToReadList(Lecture lecture) {
    if (isInReadingList(lecture)) {
      this._lectureLists["Read"].add(lecture);
      this._lectureLists["Reading"].remove(lecture);
      notifyListeners();
    }
  }

  void moveLectureFromPendingListToReadingList(Lecture lecture) {
    if (isInPendingList(lecture)) {
      this._lectureLists["Reading"].insert(0, lecture);
      this._lectureLists["Pending"].remove(lecture);
      //notifyListeners();
    }
  }

  void removeLectureFromReadingList(Lecture lecture) {
    this._lectureLists["Reading"].remove(lecture);
    notifyListeners();
  }

  void removeLectureFromReadingListAtPosition(int position) {
    this._lectureLists["Reading"].remove(position);
    notifyListeners();
  }

  bool isInReadingList(Lecture lecture) {
    return this._lectureLists["Reading"].contains(lecture);
  }

  bool isInPendingList(Lecture lecture) {
    return this._lectureLists["Pending"].contains(lecture);
  }

  bool hasLectureList(String list) {
    return this.lectures.containsKey(list);
  }

  bool isLectureInList(Lecture lecture, String list) {
    if (this.lectures.containsKey(list))
      return this.lectures[list].contains(lecture);
    return false;
  }

  void addCustomLectureList(String listName, List<Lecture> list) {
    this._lectureLists.addAll({listName: list});
    notifyListeners();
  }

  void increaseChapter(Lecture lecture) {
    int position;
    if (isInReadingList(lecture)) {
      lecture.increaseChapter();
      position = this._lectureLists["Reading"].indexOf(lecture);
      if (position != 0) {
        this._lectureLists["Reading"].removeAt(position);
        this._lectureLists["Reading"].insert(0, lecture);
      }
    } else if (isInPendingList(lecture)) {
      position = _lectureLists["Pending"].indexOf(lecture);
      this._lectureLists["Pending"][position].increaseChapter();
      if (this._lectureLists["Pending"][position].currentChapter == 1) {
        moveLectureFromPendingListToReadingList(
            this._lectureLists["Pending"][position]);
      }
    }
    notifyListeners();
  }

  List<Book> get bookshelf {
    List<Book> books = new List();
    for (String key in _lectureLists.keys) {
      for (Book book in _lectureLists[key]) {
        if (!books.contains(book)) {
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

  bool isEqual(User user) {
    return this._uid == user._uid;
  }

  int get pagesRead => _pagesRead;

  set pagesRead(int pagesRead) {
    _pagesRead = pagesRead;
  }

  int get chaptersRead => _chaptersRead;

  set chaptersRead(int chaptersRead) {
    _chaptersRead = chaptersRead;
  }

  int get booksRead => _booksRead;

  set booksRead(int booksRead) {
    _booksRead = booksRead;
  }

  List<Genre> get interestedGenres => _interestedGenres;

  set interestedGenres(List<Genre> interestedGenres) {
    _interestedGenres = interestedGenres;
  }

  void addGenreToInterestedGenres(Genre genre) {
    if (!this._interestedGenres.contains(genre))
      this._interestedGenres.add(genre);
    notifyListeners();
  }

  void removeGenreFromInterestedGenres(Genre genre) {
    if (this._interestedGenres.contains(genre))
      this._interestedGenres.remove(genre);
    notifyListeners();
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get profilePictureUrl => _profilePictureUrl;

  set profilePictureUrl(String profilePictureUrl) {
    _profilePictureUrl = profilePictureUrl;
  }

  Map<String, List<Lecture>> get bookLists => _lectureLists;

  set bookLists(Map<String, List<Book>> bookLists) {
    _lectureLists = bookLists;
  }

  User(
      this._uid,
      this._name,
      this._interestedGenres,
      this._lectureLists,
      this._booksRead,
      this._chaptersRead,
      this._pagesRead,
      this._profilePictureUrl);

  User.withBookLists(this._lectureLists);
  User.withProfilePicture(this._profilePictureUrl);
  User.withNameAndProfilePicture(this._name, this._profilePictureUrl);

  User.getMockUser() {
    List<Genre> genres = new List(); /* Genre.getMockGenres();*/
    Map<String, List<Lecture>> userLectures = {
      'Reading': new List<Lecture>(),
      'Pending': Lecture.getUserMockLectures().sublist(2, 3),
      'Read': new List<Lecture>(),
      'Recommended': Lecture.getUserMockLectures(),
      'Custom List 1': Lecture.getUserMockLectures()
    };

    List<User> friends = getMockUserFriends();

    this._uid = "1112";
    this.name = "Radu Spaimovich";
    this._interestedGenres = genres;
    this._lectureLists = userLectures;
    this._booksRead = 10;
    this._chaptersRead = 278;
    this._pagesRead = 334;
    this._profilePictureUrl =
        "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4";
    this.friends = friends;
  }

  static List<User> getMockAlterantiveUsers() {
    List<User> friends = new List();
    List<Genre> genres = Genre.getMockGenres();

    Map<String, List<Lecture>> userLectures = {
      'Reading': Lecture.getUserMockLectures().sublist(0, 1),
      'Pending': Lecture.getUserMockLectures().sublist(2, 3),
      'Read': Lecture.getUserMockLectures(),
      'Recommended': Lecture.getUserMockLectures(),
      'Custom List 1': Lecture.getUserMockLectures()
    };

    friends.add(new User("9", "Bill Gatius", genres, userLectures, 21, 198, 345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "10",
        "Bill Gatius 1",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "11",
        "Bill Gatius 2",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "12",
        "Bill Gatius 3",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(User("13", "Bill Gatius 4", genres, userLectures, 21, 198, 345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    return friends;
  }

  List<User> getMockUserFriends() {
    List<User> friends = new List();
    List<Genre> genres = Genre.getMockGenres();

    Map<String, List<Lecture>> userLectures = {
      'Reading': Lecture.getUserMockLectures().sublist(0, 1),
      'Pending': Lecture.getUserMockLectures().sublist(2, 3),
      'Read': Lecture.getUserMockLectures(),
      'Recommended': Lecture.getUserMockLectures(),
      'Custom List 1': Lecture.getUserMockLectures()
    };

    friends.add(new User("1", "Steve Jobs", genres, userLectures, 21, 198, 345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "1",
        "Steve Jobs 1",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "1",
        "Steve Jobs 2",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(new User(
        "1",
        "Steve Jobs 3",
        genres,
        userLectures,
        21,
        198,
        345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    friends.add(User("1", "Steve Jobs 33", genres, userLectures, 21, 198, 345,
        "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"));

    return friends;
  }
}

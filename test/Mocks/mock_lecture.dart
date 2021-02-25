import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:mockito/mockito.dart';

class MockLecture extends Mock implements Lecture {
  static List<MockLecture> lecturesList = [
    new MockLecture(),
    new MockLecture()
  ];

  static const int DEFAULT_CHAPTERS = 4;

  bool read;
  int currentChapter = 0;
  String picture =
      "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg";
  String title = "title";
  String author = "BookAuthor";
  String summary = "BookSummary";
  int year = 2020;
  int extension = 209;
  String editorial = "Editiorial";
  String language = "Language";
  int addedBy = 234;
  double avgRating = 4.0;
  bool isNew = false;
  List<Chapter> chapters = [
    new Chapter(null, null),
    new Chapter(null, null),
    new Chapter(null, null),
    new Chapter(null, null)
  ];
  /*List<User> friendsReading;
  Map<String, List<Item>> _shopsItems;
  Genre _mainGenre;*/

  MockLecture({this.read = false});

  bool get finished => read;

  double get progress =>
      this.currentChapter / DEFAULT_CHAPTERS; // static chapters length

  String get currentChapterTitle => "Current chapter...";

  void increaseChapter() {
    this.currentChapter = 1;
  }

  set finished(bool finished) => read;
}

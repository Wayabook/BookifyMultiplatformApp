import 'package:bookifyapp/Models/Book.dart';

import 'Item.dart';
import 'User.dart';

class Lecture extends Book{
  //String title;

  int currentChapter;

  Lecture(
      String title, String author, String coverImage, String summary, int year, int extension, String isbn, String ean,
      Map<String, List<Item>> shops_items, String editorial, String language,
      {
        double avgRating, bool isNew = false, List<String> chapters_titles = const [], List<User> friends_reading = const [],
        currentChapter = 0
      }) : super(title, author, coverImage, summary, year, extension, isbn, ean, shops_items, editorial, language,
      avgRating: avgRating, isNew: isNew, chapters_titles: chapters_titles, friends_reading: friends_reading) {}


  double get progress =>
    this.currentChapter + 1 / super.chapters_titles.length;

  String get current_chapter_title =>
      super.chapters_titles[this.currentChapter];

  int get chapters_left =>
      super.chapters_titles.length - this.currentChapter - 1;

  bool get readed =>
      this.currentChapter == super.chapters_titles.length - 1;

}
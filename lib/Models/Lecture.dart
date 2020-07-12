import 'package:bookifyapp/Models/Book.dart';

class Lecture {
  Book _book;
  int current_chapter;

  Lecture(this._book, {this.current_chapter = 0});

  double get progress =>
    current_chapter + 1 / _book.chapters_titles.length;

  String get current_chapter_title =>
      _book.chapters_titles[current_chapter];

  int get chapters_left =>
      _book.chapters_titles.length - current_chapter - 1;

  bool get readed =>
      current_chapter == _book.chapters_titles.length - 1;

}
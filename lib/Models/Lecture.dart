import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Reaction.dart';

import 'Genre.dart';
import 'Item.dart';
import 'User.dart';

class Lecture extends Book{

  int currentChapter;
  bool read;

  Lecture(
      String title,
      String author,
      String coverImage,
      String summary,
      Genre mainGenre,
      int year,
      int extension,
      Map<String, List<Item>> shops_items,
      String editorial,
      String language,
      int addedByNumberoOfPeople,
      {
        double avgRating,
        bool isNew = false,
        List<Chapter> chapters = const [],
        List<User> friends_reading = const [],
        this.currentChapter = 0,
        this.read = false,
      }) : super(
      title,
      author,
      coverImage,
      summary,
      mainGenre,
      year,
      extension,
      /*isbn,
      ean,*/
      shops_items,
      editorial,
      language,
      avgRating: avgRating,
      isNew: isNew,
      chapters:
      chapters,
      friends_reading:
      friends_reading);

  List<Reaction> getCurrentChapterReactions(){
    return this.chapters[this.currentChapter].reactions;
  }

  void increaseChapter() {
    this.read = this.currentChapter + 1 < super.chapters.length ? false : true;
    if(!finished)
      this.currentChapter++;
  }

  bool get finished =>  read;

  double get progress =>
    this.currentChapter / super.chapters.length;

  String get current_chapter_title =>
      super.chapters[this.currentChapter].title;

  int get chapters_left =>
      super.chapters.length - this.currentChapter - 1;

  bool get readed =>
      this.currentChapter == super.chapters.length - 1;

  static List<Lecture> bookListToLectures(List<Book> books){
    List<Lecture> lectures = new List();
    for(Book book in books){
      lectures.add(book.toLecture());
    }
    return lectures;
  }

  static  List<Lecture> getUserMockLectures(){
    return bookListToLectures(Book.getUserMockBooks());

  }

}
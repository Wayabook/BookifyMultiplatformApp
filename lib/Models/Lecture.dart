import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Reaction.dart';

import 'Item.dart';
import 'User.dart';

class Lecture extends Book{
  //String title;

  int currentChapter;
  List<Reaction> _reactions;

  Lecture(
      String title,
      String author,
      String coverImage,
      String summary,
      int year,
      int extension,
      String isbn,
      String ean,
      Map<String, List<Item>> shops_items,
      String editorial,
      String language,
      int addedByNumberoOfPeople,
      {
        double avgRating,
        bool isNew = false,
        List<String> chapters_titles = const [],
        List<User> friends_reading = const [],
        currentChapter = 0
      }) : super(
      title,
      author,
      coverImage,
      summary,
      year,
      extension,
      isbn,
      ean,
      shops_items,
      editorial,
      language,
      avgRating: avgRating,
      isNew: isNew,
      chaptersTitles:
      chapters_titles,
      friends_reading:
      friends_reading) {}
      
      
  List<Reaction> reactions() {
    if(this._reactions == null){
      this._reactions = new List();
      this._reactions.add(new Reaction("ANGRY", "images/angry.png", 60));
      this._reactions.add(new Reaction("SCARED", "images/scared.png", 60));
      this._reactions.add(new Reaction("SAD", "images/unhappy.png", 60));
      this._reactions.add(new Reaction("CONFUSED", "images/confused.png", 60));

      this._reactions.add(new Reaction("BORED", "images/bored.png", 60));
      this._reactions.add(new Reaction("SURPRISED", "images/surprised.png", 60));
      this._reactions.add(new Reaction("HAPPY", "images/happy.png", 60));
      this._reactions.add(new Reaction("EXCITED", "images/excited.png", 60));

    }
    return this._reactions;
  }

  void increaseChapter() {
    this.currentChapter++;
  }

  double get progress =>
    this.currentChapter + 1 / super.chaptersTitles.length;

  String get current_chapter_title =>
      super.chaptersTitles[this.currentChapter];

  int get chapters_left =>
      super.chaptersTitles.length - this.currentChapter - 1;

  bool get readed =>
      this.currentChapter == super.chaptersTitles.length - 1;

}
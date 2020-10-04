
import 'package:bookifyapp/Models/MainComment.dart';

import 'Reaction.dart';

class Chapter{

  int number;
  String title;
  List<Reaction> reactions;
  List<MainComment> comments;

  Chapter(this.number, this.title, {this.comments = const[]}) {
    this.reactions = _getReactions();
  }

  void removeComment(MainComment mainComment){
    this.comments.remove(mainComment);
  }

  void addComment(MainComment mainComment){
    this.comments.add(mainComment);
  }

  List<Reaction> _getReactions() {
    return Reaction.getMockReactions();
  }

  static List<Chapter> getMockChapters(){
    List<Chapter> chapters = new List();
    chapters.add(new Chapter(1, "Capitulo 1 :  Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(2, "Capitulo 2 :  Post Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(3, "Capitulo 3 :  Pre Final", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(4, "Capitulo 4 :  Final", comments: MainComment.getMockMainComments()));
    return chapters;
  }
}
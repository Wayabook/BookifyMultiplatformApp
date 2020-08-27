import 'package:bookifyapp/Models/Comment.dart';

import 'User.dart';

class MainComment extends Comment{
  //int answers;
  //String comment;
  List<Comment> answers;

  MainComment(
      User author,
      String comment,
      {
        this.answers: const [],
        int likes: 0,
      }
  ) : super (author, comment, likes: likes);
}
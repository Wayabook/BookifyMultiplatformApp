import 'User.dart';

class Comment {
  User author;
  int likes;
  String comment;

  Comment(this.author, this.comment, {this.likes = 0});
}
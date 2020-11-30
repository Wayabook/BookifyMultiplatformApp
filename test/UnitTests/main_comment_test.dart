import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Main Comment Tests', () {

    //final comment = Comment();

    test('Main Comment with default values', (){
      final comment = new MainComment(User.getMockUser(), "Default Comment");
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 0);
      expect(comment.answers.length, 0);
      expect(comment.likedBy, []);
      expect(comment.likes, comment.likedBy.length);
      expect(comment.answers, []);
    });

    test('Main Comment with non default values', (){
      List<User> users= new List();
      final answer = new Comment(User.getMockUser(), "Default Comment");
      final comment = new MainComment(User.getMockUser(), "Default Comment", likes: 2, answers: [answer, answer]);
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.answers.length, 2);
      expect(comment.likedBy, []);
      expect(comment.likes, 2);
      expect(comment.answers, [answer, answer]);
    });
  });
}
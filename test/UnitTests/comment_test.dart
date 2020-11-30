import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Comment Tests', () {

    //final comment = Comment();

    test('Comment with default values', (){
      final comment = new Comment(User.getMockUser(), "Default Comment");
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 0);
      expect(comment.likedBy, []);
      expect(comment.likes, comment.likedBy.length);
    });

    test('Comment non default values', (){
      List<User> users= new List();
      users.add(User.getMockUser());
      users.add(User.getMockUser());
      final comment = new Comment(User.getMockUser(), "Default Comment", likes: 2, likedBy: users);
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.likedBy, users);
      expect(comment.likes, comment.likedBy.length);
    });
  });
}
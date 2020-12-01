import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User{}

void main(){
  group('Comment Tests', () {

    MockUser mockUser = new MockUser();

    test('Comment with default values', (){
      final comment = new Comment(mockUser, "Default Comment");
      expect(comment.comment, "Default Comment");
      expect(comment.author, mockUser);
      expect(comment.likes, 0);
      expect(comment.likedBy, []);
      expect(comment.likes, comment.likedBy.length);
    });

    test('Comment non default values', (){
      List<User> users= [new MockUser(), new MockUser()];
      final comment = new Comment(mockUser, "Default Comment", likes: 2, likedBy: users);
      expect(comment.comment, "Default Comment");
      expect(comment.author, mockUser);
      expect(comment.likes, 2);
      expect(comment.likedBy, users);
      expect(comment.likes, comment.likedBy.length);
    });
  });
}
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User{}
class MockComment extends Mock implements Comment{}


void main(){
  group('Main Comment Tests', () {

    MockUser mockUser = new MockUser();

    test('Main Comment with default values', (){
      final comment = new MainComment(mockUser, "Default Comment");
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 0);
      expect(comment.answers.length, 0);
      expect(comment.likedBy, []);
      expect(comment.likes, comment.likedBy.length);
      expect(comment.answers, []);
    });

    test('Main Comment with non default values', (){

      final mockComment = new MockComment();
      final mockComment2 = new MockComment();
      final comment = new MainComment(mockUser, "Default Comment", likes: 2, answers: [mockComment, mockComment2]);

      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.answers.length, 2);
      expect(comment.likedBy, []);
      expect(comment.likes, 2);
      expect(comment.answers, [mockComment, mockComment2]);
    });
  });
}
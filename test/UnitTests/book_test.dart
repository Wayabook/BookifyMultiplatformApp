import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGenre extends Mock implements Genre {}
class MockItem extends Mock implements Item {}


void main(){
  group('Comment Tests', () {

    MockGenre mockGenre = new MockGenre();

    test('Book with default values', (){
      Book defaultBook = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        new Map<String, List<MockItem>> (),
        "Editorial",
        "Language",
      );

      /*
      *  {
            this.avgRating,
            this.isNew = false,
            this.addedBy = 2049,
            this.chapters = const [],
            this.friends_reading = const [],
          }
      * */
      expect(defaultBook.title , "Book Title");
      expect(defaultBook.author, "Book Author");
      expect(defaultBook.picture, "Book Cover Image");
      expect(defaultBook.summary, "Book Summary");
      expect(defaultBook.mainGenre, mockGenre);
      expect(defaultBook.year, 1997);
      expect(defaultBook.extension, 203);
      expect(defaultBook.editorial, "Editorial");
      expect(defaultBook.language, "Language");
    });

    /*test('Book with non default values', (){
      List<User> users= new List();
      users.add(User.getMockUser());
      users.add(User.getMockUser());
      final comment = new Comment(User.getMockUser(), "Default Comment", likes: 2, likedBy: users);
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.likedBy, users);
      expect(comment.likes, comment.likedBy.length);
    });

    test('Comparing same books', (){
      List<User> users= new List();
      users.add(User.getMockUser());
      users.add(User.getMockUser());
      final comment = new Comment(User.getMockUser(), "Default Comment", likes: 2, likedBy: users);
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.likedBy, users);
      expect(comment.likes, comment.likedBy.length);
    });

    test('Comparing different books', (){
      List<User> users= new List();
      users.add(User.getMockUser());
      users.add(User.getMockUser());
      final comment = new Comment(User.getMockUser(), "Default Comment", likes: 2, likedBy: users);
      expect(comment.comment, "Default Comment");
      expect(comment.likes, 2);
      expect(comment.likedBy, users);
      expect(comment.likes, comment.likedBy.length);
    });*/
  });
}
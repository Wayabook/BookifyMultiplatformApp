import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGenre extends Mock implements Genre {}

class MockItem extends Mock implements Item {}

class MockUser extends Mock implements User {}

class MockChapter extends Mock implements Chapter {}

void main() {
  group('Comment Tests', () {
    MockGenre mockGenre = new MockGenre();
    List<MockChapter> mockChapters = [new MockChapter(), new MockChapter()];
    List<MockUser> mockUsers = [new MockUser(), new MockUser()];
    Map<String, List<MockItem>> mockItems = new Map<String, List<MockItem>>();

    test('Book with default values', () {
      Book defaultBook = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
      );

      expect(defaultBook.title, "Book Title");
      expect(defaultBook.author, "Book Author");
      expect(defaultBook.picture, "Book Cover Image");
      expect(defaultBook.summary, "Book Summary");
      expect(defaultBook.mainGenre, mockGenre);
      expect(defaultBook.year, 1997);
      expect(defaultBook.extension, 203);
      expect(defaultBook.shopsItems, mockItems);
      expect(defaultBook.editorial, "Editorial");
      expect(defaultBook.language, "Language");
      expect(defaultBook.avgRating, null);
      expect(defaultBook.isNew, false);
      expect(defaultBook.addedBy, 2049);
      expect(defaultBook.chapters, []);
      expect(defaultBook.friendsReading, []);
    });

    test('Book with non default values', () {
      Book defaultBook = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
        avgRating: 2.5,
        isNew: true,
        addedBy: 200,
        chapters: mockChapters,
        friendsReading: mockUsers,
      );

      expect(defaultBook.title, "Book Title");
      expect(defaultBook.author, "Book Author");
      expect(defaultBook.picture, "Book Cover Image");
      expect(defaultBook.summary, "Book Summary");
      expect(defaultBook.mainGenre, mockGenre);
      expect(defaultBook.year, 1997);
      expect(defaultBook.extension, 203);
      expect(defaultBook.shopsItems, mockItems);
      expect(defaultBook.editorial, "Editorial");
      expect(defaultBook.language, "Language");
      expect(defaultBook.avgRating, 2.5);
      expect(defaultBook.isNew, true);
      expect(defaultBook.addedBy, 200);
      expect(defaultBook.chapters, mockChapters);
      expect(defaultBook.friendsReading, mockUsers);
    });

    test('Comparing same books', () {
      Book defaultBook = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
        avgRating: 2.5,
        isNew: true,
        addedBy: 200,
        chapters: mockChapters,
        friendsReading: mockUsers,
      );

      Book defaultBook2 = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
        avgRating: 2.5,
        isNew: true,
        addedBy: 200,
        chapters: mockChapters,
        friendsReading: mockUsers,
      );

      expect(defaultBook == defaultBook2, true);
    });

    test('Comparing different books', () {
      Book defaultBook = Book(
        "Book Title",
        "Book Author",
        "Book Cover Image",
        "Book Summary",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
        avgRating: 2.5,
        isNew: true,
        addedBy: 200,
        chapters: mockChapters,
        friendsReading: mockUsers,
      );

      Book defaultBook2 = Book(
        "Book Title1",
        "Book Author1",
        "Book Cover Image1",
        "Book Summary1",
        mockGenre,
        1997,
        203,
        mockItems,
        "Editorial",
        "Language",
        avgRating: 2.5,
        isNew: true,
        addedBy: 200,
        chapters: mockChapters,
        friendsReading: mockUsers,
      );

      expect(defaultBook == defaultBook2, false);
    });
  });
}

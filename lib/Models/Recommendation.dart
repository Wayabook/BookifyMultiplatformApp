import 'Book.dart';
import 'User.dart';

class Recommendation {

  List<Book> _recommendedBooks;
  User _recommendedBy;

  Recommendation(this._recommendedBy, this._recommendedBooks);

  User get recommendedBy => _recommendedBy;

  List<Book> get recommendedBooks => _recommendedBooks;

  static Recommendation getMockRecommendation(){
    return new Recommendation(
        User.getMockUser(),
        Book.getUserMockBooks(),
    );
  }

}
import 'Book.dart';
import 'User.dart';

class Recommendation {

  Book _recommendedBook;
  User _recommendedBy;

  Recommendation(this._recommendedBy, this._recommendedBook);

  User get recommendedBy => _recommendedBy;

  Book get recommendedBook => _recommendedBook;

  static List<Recommendation> getRecommendationListFromBook(List<Book> books, User user){
    List<Recommendation> recommendations = new List();
    for(Book book in books){
      recommendations.add(new Recommendation(user, book));
    }
    return recommendations;
  }

  static List<Book> getRecommendedBooksFromRecommendations(List<Recommendation> recommendations){
    List<Book> books = new List();
    for(Recommendation recommendation in recommendations)
      books.add(recommendation.recommendedBook);
    return books;

  }

  static List<Recommendation> getMockRecommendation(){
    List<Recommendation> mockRecommendation = new List();
    for(Book book in Book.getUserMockBooks()){
      mockRecommendation.add(new Recommendation(User.getMockUser(), book));
    }
    return mockRecommendation;
  }

  static List<Book> getBooksFromRecommendations(List<Recommendation> recommendations){
    List<Book> books = new List();
    for(Recommendation recommendation in recommendations){
      books.add(recommendation.recommendedBook);
    }
    return books;
  }

  static List<User> getUsersFromRecommendations(List<Recommendation> recommendations){
    List<User> users = new List();
    for(Recommendation recommendation in recommendations){
      users.add(recommendation.recommendedBy);
    }
    return users;
  }

  static List<User> getBookRecommenders(List<Recommendation> recommendations, Book book){
    List<User> recommenders = new List();
    for(Recommendation recommendation in recommendations){
      if(recommendation.recommendedBook == book)
        recommenders.add(recommendation.recommendedBy);
    }
    return recommenders;
  }



}
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Shop Tests', () {

    final genre = Genre.withoutId("Genre Name", "Genre Picture Url");

    test('Get Genre Name', (){
      expect(genre.name, "Genre Name");
    });

    test('Get Genre Url', (){
      expect(genre.picture, "Genre Picture Url");
    });
  });
}
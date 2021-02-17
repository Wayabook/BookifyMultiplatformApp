import 'package:bookifyapp/Models/Genre.dart';
import 'package:mockito/mockito.dart';

class MockGenre extends Mock implements Genre {
  String picture = "genre2.png";
  String name = "Mock Genre";

  MockGenre();
}

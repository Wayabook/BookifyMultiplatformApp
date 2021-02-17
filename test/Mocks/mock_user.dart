import 'package:bookifyapp/Models/User.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {
  String name = "user";
  String profilePictureUrl =
      "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg";
  MockUser();
}

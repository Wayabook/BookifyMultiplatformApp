import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockUser extends Mock implements User {
  String name = "user";
  String profilePictureUrl =
      "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg";

  MockUser();
}

class MockComment extends Mock implements Comment {}

class MockMainComment extends Mock implements MainComment {
  User author = new MockUser();
  String comment = "Comment added";
  int likes;

  List<Comment> answers = new List();

  MockMainComment({this.likes = 0});
}

void main() {
  setUp(() {
    SizeConfig().initDefault();
    ChangeNotifierProvider<User>(create: (context) => User.getMockUser());
  });

  /*{
        this.fromDialog = false,
        this.seeAllComments = false,
        this.chapterTitle = "",
        this.chapterNumber = 0,
        Function(int) removeCommentFunction,
        int positionKey,
      }) {
        this.positionKey = positionKey;
        this.removeCommentFunction = removeCommentFunction;
      }*/

  group('Main Comment Card Widget Tests', () {
    testWidgets('Main Comment Container Card Widget Test',
        (WidgetTester tester) async {
      /*final widget = MainCommentCard(MockMainComment());
      await tester.pumpWidget(widget);
      expect(find.byType(MainCommentCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));*/

      // Check widget image and visibility
      /*await tester.pump(const Duration(milliseconds: 3000));
      expect(find.byType(Image), findsOneWidget);
      await tester.ensureVisible(find.byType(Image));

      // Check widget text, visibility and style
      expect(find.byType(BorderedText), findsOneWidget);
      BorderedText borderedText = tester.firstWidget(find.byType(BorderedText));
      expect(borderedText.strokeWidth, 1.0);
      expect(borderedText.strokeColor, kPrimaryLightColor);

      Text text = borderedText.child;
      expect(text.data, defaultIndex);
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.decorationThickness, 1);

      //Assures genre container visibility
      expect(find.byType(GenreContainer), findsOneWidget);
      await tester.ensureVisible(find.byType(GenreContainer));*/
    });
  });
}

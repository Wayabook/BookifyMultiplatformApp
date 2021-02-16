import 'dart:ui';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container_card.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/user_preview_card.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {
  String name = "user";
  String profilePictureUrl =
      "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg";
  MockUser();
}

void main() {
  MockUser user = new MockUser();

  setUp(() {
    SizeConfig().initDefault();
  });

  /***
   *  GenreCard(this.genre,
      {this.addGenreCard = false, this.index = 0, this.onAddGenrePressed});
   * */

  group('User Preview Card Widget Tests', () {
    testWidgets('Normal User Preview Card Widget Test',
        (WidgetTester tester) async {
      final widget = UserPreviewCard(user);

      await tester.pumpWidget(widget);
      expect(find.byType(UserPreviewCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

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

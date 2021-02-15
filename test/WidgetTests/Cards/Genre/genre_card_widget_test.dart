import 'dart:ui';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container_card.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGenre extends Mock implements Genre {
  String picture = "genre2.png";
  String name = "Mock Genre";

  MockGenre();
}

void main() {
  String defaultIndex = "1";
  String modifiedIndex = "3";
  setUp(() {
    SizeConfig().initDefault();
  });

  /***
   *  GenreCard(this.genre,
      {this.addGenreCard = false, this.index = 0, this.onAddGenrePressed});
   * */

  group('Genre Card Widget Tests', () {
    testWidgets('Normal Genre Container Card Widget Test',
        (WidgetTester tester) async {
      //final widget = ReactionCard(reaction);
      final widget = GenreCard(MockGenre());
      await tester.pumpWidget(widget);
      expect(find.byType(GenreCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      // Check widget image and visibility
      await tester.pump(const Duration(milliseconds: 3000));
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
      await tester.ensureVisible(find.byType(GenreContainer));
    });

    testWidgets('Modified Genre Container Card Widget Test',
        (WidgetTester tester) async {
      //final widget = ReactionCard(reaction);
      final widget = GenreCard(
        MockGenre(),
        index: 2,
      );
      await tester.pumpWidget(widget);
      expect(find.byType(GenreCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      // Check widget text, visibility and style
      expect(find.byType(BorderedText), findsOneWidget);
      BorderedText borderedText = tester.firstWidget(find.byType(BorderedText));

      Text text = borderedText.child;
      expect(text.data, modifiedIndex);
    });

    testWidgets('Add Genre Container Card Widget Test',
        (WidgetTester tester) async {
      //final widget = ReactionCard(reaction);
      var initialValue = 0;
      final widget = GenreCard(
        MockGenre(),
        addGenreCard: true,
        onAddGenrePressed: (ButtonType buttonType, BuildContext context,
            {String title}) {
          initialValue += 1;
        },
      );

      await tester.pumpWidget(widget);
      expect(find.byType(GenreCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      expect(find.byIcon(Icons.add), findsOneWidget);
      await tester.ensureVisible(find.byType(Icon));

      expect(find.byType(Text), findsOneWidget);
      await tester.ensureVisible(find.byType(Text));

      await tester.tap(find.byType(Icon));
      await tester.pump(const Duration(milliseconds: 100));

      expect(initialValue, 1);
    });
  });
}

import 'dart:ui';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container_card.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../Mocks/mock_genre.dart';
import '../../../widget_test_functions.dart';

String defaultIndex = "1";
String modifiedIndex = "3";

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Genre Card Widget Tests', () {
    testWidgets('Normal Genre Container Card Widget Test',
        (WidgetTester tester) async {
      final widget = GenreCard(MockGenre());
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, GenreCard);

      // Check widget image and visibility
      await WidgetTestFunctions.checkImageAndVisibilityTest(tester, Image);

      // Check widget text, visibility and style
      checkBorderedText(tester);

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
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, GenreCard);

      // Check widget text, visibility and style
      checkBorderedText(tester, checkText: true);
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

      await WidgetTestFunctions.pumpWidgetTest(tester, widget, GenreCard);

      expect(find.byIcon(Icons.add), findsOneWidget);
      await tester.ensureVisible(find.byType(Icon));

      expect(find.byType(Text), findsOneWidget);
      await tester.ensureVisible(find.byType(Text));

      await WidgetTestFunctions.tapByType(tester, Icon, duration: 100);
      expect(initialValue, 1);
    });
  });
}

void checkBorderedText(tester, {checkText = false}) {
  expect(find.byType(BorderedText), findsOneWidget);
  BorderedText borderedText = tester.firstWidget(find.byType(BorderedText));

  expect(borderedText.strokeWidth, 1.0);
  expect(borderedText.strokeColor, kPrimaryLightColor);

  Text text = borderedText.child;
  if (checkText) {
    expect(text.data, modifiedIndex);
  } else {
    expect(text.data, defaultIndex);
    expect(text.style.color, kThirdDarkColor);
    expect(text.style.decorationThickness, 1);
  }
}

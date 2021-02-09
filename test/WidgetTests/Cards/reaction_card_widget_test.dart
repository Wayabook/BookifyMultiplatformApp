import 'dart:ui';

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Reaction/reaction_card.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/*class MockSizeConfig extends Mock implements SizeConfig {}

class MockBook extends Mock implements Book {}

class MockLecture extends Mock implements Lecture {
  bool read;
  MockLecture({this.read = false});

  bool get finished => read;

  set finished(bool finished) => read;
}*/

void main() {
  //MockLecture mockLecture = new MockLecture();
  String reactionText = "ANGRY";
  Reaction reaction = new Reaction(reactionText, "images/angry.png", 60);
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Reaction Card Widget Tests', () {
    testWidgets('Normal Reaction Card Test', (WidgetTester tester) async {
      // Creates ReactionCard Widget
      final widget = ReactionCard(reaction);
      await tester.pumpWidget(widget);
      expect(find.byType(ReactionCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      // Check widget image and visibility
      await tester.pump(const Duration(milliseconds: 3000));
      expect(find.byType(Image), findsOneWidget);
      await tester.ensureVisible(find.byType(Image));

      // Checks card properties
      final cardWidget = find.byType(Card);
      expect(find.byType(Card), findsOneWidget);
      Card card = tester.firstWidget(cardWidget);
      expect(card.color, kPrimaryDarkColor);
      expect(card.elevation, (PADDING_FACTOR_10 * SizeConfig.widthMultiplier));
      Border border = card.shape;
      expect(border.left.width, 0);

      // Check widget text, visibility and style
      final textWidget = find.text(reactionText);
      expect(textWidget, findsOneWidget);

      Text text = tester.firstWidget(textWidget);
      expect(text.style.color, kThirdDarkColor);
      expect(
          text.style.fontSize, PADDING_FACTOR_8 * SizeConfig.heightMultiplier);
    });

    testWidgets('Tapped Reaction Card Test', (WidgetTester tester) async {
      // Creates ReactionCard Widget
      final widget = ReactionCard(reaction);
      await tester.pumpWidget(widget);
      expect(find.byType(ReactionCard), findsOneWidget);
      await tester.ensureVisible(find.byWidget(widget));

      // Taps widget and checks that values have modified
      await tester.tap(find.byType(ReactionCard));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.ensureVisible(find.byType(ReactionCard));

      final textWidget = find.text(
          reaction.percentage.toString() + ReactionCard.PERCENTAGE_SYMBOL);
      expect(textWidget, findsOneWidget);

      Text text = tester.firstWidget(textWidget);
      expect(text.style.color, kThirdDarkColor);
      expect(
          text.style.fontSize, PADDING_FACTOR_8 * SizeConfig.heightMultiplier);

      // Checks card and border properties
      final cardWidget = find.byType(Card);
      expect(find.byType(Card), findsOneWidget);
      Card card = tester.firstWidget(cardWidget);
      expect(card.color, kPrimaryDarkColor);
      expect(card.elevation, (PADDING_FACTOR_10 * SizeConfig.widthMultiplier));
      Border border = card.shape;
      expect(border.left.width,
          (CONTAINER_FACTOR_2 * SizeConfig.imageSizeMultiplier));
      expect(border.left.color, kSecondaryDarkColor);
    });
  });
}
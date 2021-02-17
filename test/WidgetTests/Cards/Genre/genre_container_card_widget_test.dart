import 'dart:ui';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container_card.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../Mocks/mock_genre.dart';
import '../../../widget_test_functions.dart';

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Genre Container Card Widget Tests', () {
    testWidgets('Unmarked Genre Container Card Widget Test',
        (WidgetTester tester) async {
      //final widget = ReactionCard(reaction);
      final widget = GenreContainer(
        MockGenre(),
        false,
        width: 120,
        height: 120,
        containerWidth: 100,
        containerHeight: 100,
      );
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, GenreContainer);

      // Check widget image and visibility
      await WidgetTestFunctions.checkImageAndVisibilityTest(tester, Image);

      // Checks card properties
      final container = find.byType(Container);
      expect(find.byType(Container), findsNWidgets(2));
      Container box = tester.firstWidget(container);
      BoxDecoration boxDecoration = box.decoration;
      expect(boxDecoration.color, kSecondaryLightColor);
      expect(
          boxDecoration.borderRadius.resolve(TextDirection.ltr),
          BorderRadius.circular(
              (BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)));

      // Check widget text, visibility and style
      final textWidget = find.text(MockGenre().name);
      expect(textWidget, findsOneWidget);

      Text text = tester.firstWidget(textWidget);
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontWeight, FontWeight.bold);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
    });

    testWidgets('Marked Genre Container Card Widget Test',
        (WidgetTester tester) async {
      //final widget = ReactionCard(reaction);
      final widget = GenreContainer(
        MockGenre(),
        true,
        width: 120,
        height: 120,
        containerWidth: 100,
        containerHeight: 100,
      );
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, GenreContainer);

      // Check widget image and visibility
      await WidgetTestFunctions.checkImageAndVisibilityTest(tester, Image);

      // Checks card properties
      final container = find.byType(Container);
      expect(find.byType(Container), findsNWidgets(2));
      Container box = tester.firstWidget(container);
      BoxDecoration boxDecoration = box.decoration;
      expect(boxDecoration.color, kGreenLightColor);
      expect(
          boxDecoration.borderRadius.resolve(TextDirection.ltr),
          BorderRadius.circular(
              (BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)));
    });
  });
}

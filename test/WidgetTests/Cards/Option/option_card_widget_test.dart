import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/OptionCard/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_functions.dart';

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Option Card Widget Tests', () {
    //final comment = Comment();

    testWidgets('Default Discover Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.disover);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, OptionCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.discover_icon);
      _checkIconButton(tester, iconButton);

      final textWidget = find.text(OptionCard.discover_text);
      _checkTextProperties(tester, textWidget);
    });

    testWidgets('Default View All Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.view_all);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, OptionCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.view_all_icon);
      _checkIconButton(tester, iconButton);

      final textWidget = find.text(OptionCard.view_all_text);
      _checkTextProperties(tester, textWidget);
    });

    testWidgets('Default Add Custom List Option Card',
        (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.add_custom_list);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, OptionCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.add_custom_list_icon);
      _checkIconButton(tester, iconButton);

      final textWidget = find.text(OptionCard.add_custom_list_text);
      _checkTextProperties(tester, textWidget);
    });

    testWidgets('Default Recommend Book Option Card',
        (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.recommend_book);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, OptionCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.recommend_book_icon);
      _checkIconButton(tester, iconButton);

      final textWidget = find.text(OptionCard.recommend_book_text);
      _checkTextProperties(tester, textWidget);
    });

    testWidgets('Default Settings Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.settings);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, OptionCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.settings_icon);
      _checkIconButton(tester, iconButton);

      final textWidget = find.text(OptionCard.settings_text);
      _checkTextProperties(tester, textWidget);
    });
  });
}

_checkIconButton(tester, iconButton) async {
  expect(iconButton, findsOneWidget);
  await tester.ensureVisible(find.byType(OptionCard));

  // Checks widget icon color and size
  Icon icon = tester.firstWidget(iconButton);
  expect(icon.color, kThirdDarkColor);
  expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));
}

_checkTextProperties(tester, textWidget) {
  expect(textWidget, findsOneWidget);

  //Getting text object
  Text text = tester.firstWidget(textWidget);
  //Validating properties
  expect(text.style.color, kThirdDarkColor);
  expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
  expect(text.style.fontWeight, FontWeight.bold);
}

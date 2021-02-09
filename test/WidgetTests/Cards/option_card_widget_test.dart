import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/OptionCard/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    SizeConfig().initDefault();
  });

  group('Option Card Widget Tests', () {
    //final comment = Comment();

    testWidgets('Default Discover Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.disover);
      await tester.pumpWidget(widget);
      expect(find.byType(OptionCard), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.discover_icon);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(OptionCard));

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));

      final textWidget = find.text(OptionCard.discover_text);
      expect(textWidget, findsOneWidget);

      //Getting text object
      Text text = tester.firstWidget(textWidget);
      //Validating properties
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
      expect(text.style.fontWeight, FontWeight.bold);
    });

    testWidgets('Default View All Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.view_all);
      await tester.pumpWidget(widget);
      expect(find.byType(OptionCard), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.view_all_icon);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(OptionCard));

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));

      final textWidget = find.text(OptionCard.view_all_text);
      expect(textWidget, findsOneWidget);

      //Getting text object
      Text text = tester.firstWidget(textWidget);
      //Validating properties
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
      expect(text.style.fontWeight, FontWeight.bold);
    });

    testWidgets('Default Add Custom List Option Card',
        (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.add_custom_list);
      await tester.pumpWidget(widget);
      expect(find.byType(OptionCard), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.add_custom_list_icon);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(OptionCard));

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));

      final textWidget = find.text(OptionCard.add_custom_list_text);
      expect(textWidget, findsOneWidget);

      //Getting text object
      Text text = tester.firstWidget(textWidget);
      //Validating properties
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
      expect(text.style.fontWeight, FontWeight.bold);
    });

    testWidgets('Default Recommend Book Option Card',
        (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.recommend_book);
      await tester.pumpWidget(widget);
      expect(find.byType(OptionCard), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.recommend_book_icon);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(OptionCard));

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));

      final textWidget = find.text(OptionCard.recommend_book_text);
      expect(textWidget, findsOneWidget);

      //Getting text object
      Text text = tester.firstWidget(textWidget);
      //Validating properties
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
      expect(text.style.fontWeight, FontWeight.bold);
    });

    testWidgets('Default Settings Option Card', (WidgetTester tester) async {
      final widget = OptionCard(BookCardType.settings);
      await tester.pumpWidget(widget);
      expect(find.byType(OptionCard), findsOneWidget);

      // Check widget icon and visibility
      final iconButton = find.byIcon(OptionCard.settings_icon);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(find.byType(OptionCard));

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier));

      final textWidget = find.text(OptionCard.settings_text);
      expect(textWidget, findsOneWidget);

      //Getting text object
      Text text = tester.firstWidget(textWidget);
      //Validating properties
      expect(text.style.color, kThirdDarkColor);
      expect(text.style.fontSize, (TEXT_FACTOR_14 * SizeConfig.textMultiplier));
      expect(text.style.fontWeight, FontWeight.bold);
    });
  });
}

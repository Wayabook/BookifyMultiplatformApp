//    items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€", "1", "2"));

import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/OptionCard/option_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/ShopItem/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../Mocks/mock_item.dart';
import '../../../widget_test_functions.dart';
//SizeConfig sizeConfig;

void main() {
  MockItem mockItem = new MockItem.withoutId(16.05, "€");

  setUp(() {
    SizeConfig().initDefault();
  });

  group('Shop Item Card Widget Tests', () {
    //final comment = Comment();

    testWidgets('Default Shop Item Card', (WidgetTester tester) async {
      final widget = ShopItemCard(mockItem);
      await WidgetTestFunctions.pumpWidgetTest(tester, widget, ShopItemCard);

      // Check widget icon and visibility
      final iconButton = find.byIcon(ShopItemCard.GO_SHOP_ICON);
      expect(iconButton, findsOneWidget);
      await tester.ensureVisible(iconButton);

      // Checks widget icon color and size
      Icon icon = tester.firstWidget(iconButton);
      expect(icon.color, kThirdDarkColor);
      expect(icon.size, (ICON_FACTOR_24 * SizeConfig.imageSizeMultiplier));

      // Checks price text
      final textWidget =
          await _checkAndGetText(tester, mockItem.price.toString());

      //Getting text object
      Text priceText = tester.firstWidget(textWidget);
      //Validating properties
      expect(priceText.style.color, kThirdDarkColor);
      expect(priceText.style.fontSize,
          (TEXT_FACTOR_30_H * SizeConfig.textMultiplier));
      expect(priceText.style.fontWeight, FontWeight.bold);

      // Checks price text
      final textWidget2 =
          await _checkAndGetText(tester, mockItem.symbol.toString());

      //Getting text object
      Text priceSymbolText = tester.firstWidget(textWidget2);
      //Validating properties
      expect(priceSymbolText.style.color, kThirdDarkColor);
      expect(priceSymbolText.style.fontSize,
          (TEXT_FACTOR_30_H * SizeConfig.textMultiplier));
      expect(priceSymbolText.style.fontWeight, FontWeight.bold);
    });
  });
}

_checkAndGetText(tester, text) async {
  final textWidget = find.text(text);
  expect(textWidget, findsOneWidget);
  await tester.ensureVisible(textWidget);
  return textWidget;
}

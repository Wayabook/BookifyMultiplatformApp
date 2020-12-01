import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockShop extends Mock implements Shop {}

void main(){
  group('Item Tests', () {

    final shop = new MockShop();
    final item  = Item.withoutId(shop, "ShopLink", 1, "Symbol", "ISBN", "EAN");

    test('Get Item Link', (){
      expect(item.shop_link, "ShopLink");
    });

    test('Get Item Price', (){
      expect(item.price, 1);
    });

    test('Get Item Symbol', (){
      expect(item.symbol, 'Symbol');
    });

    test('Get Item ISBN', (){
      expect(item.isbn, 'ISBN');
    });

    test('Get Item EAN', (){
      expect(item.ean, 'EAN');
    });
  });
}
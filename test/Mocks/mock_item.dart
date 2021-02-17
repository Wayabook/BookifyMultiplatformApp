import 'package:bookifyapp/Models/Item.dart';
import 'package:mockito/mockito.dart';
import 'mock_shop.dart';

class MockItem extends Mock implements Item {
  double price;
  String symbol;
  MockShop shop = MockShop();

  MockItem.withoutId(
    this.price,
    this.symbol,
  );
}

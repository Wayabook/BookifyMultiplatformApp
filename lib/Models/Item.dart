import 'package:bookifyapp/Models/Shop.dart';

class Item{
  String _id;
  double _price;
  String _symbol;
  String _shop_link;
  Shop _shop;


  Item.withoutId(this._shop, this._shop_link, this._price, this._symbol);

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  String get symbol => _symbol;

  set symbol(String symbol) {
    _symbol = symbol;
  }

  String get shop_link => _shop_link;

  set shop_link(String shop_link) {
    _shop_link = shop_link;
  }

  Shop get shop => _shop;

  set shop(Shop shop) {
    _shop = shop;
  }
}
import 'package:bookifyapp/Models/Shop.dart';

class Item{
  String _id;
  double _price;
  String _symbol;
  String _shop_link;
  Shop _shop;


  Item.withoutId(this._shop, this._shop_link, this._price, this._symbol);
}
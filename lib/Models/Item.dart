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

  static List<Item> getMockItems(){
    List<Shop> shops = Shop.getMockShops();
    List<Item> items = new List();
    items.add(new Item.withoutId(shops[0], "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€"));
    items.add(new Item.withoutId(shops[1], "https://www.fnac.es/a7456973/En-busca-del-chico-irrompible#st=el+chico+irr&ct=En+todo+Fnac&t=p", 16.05, "€"));
    items.add(new Item.withoutId(shops[2], "https://www.elcorteingles.es/libros/A35120735-en-busca-del-chico-irrompible-tapa-dura-9788408228059/", 16.05, "€"));
    items.add(new Item.withoutId(shops[3], "https://www.tagusbooks.com/ebook-en-busca-del-chico-irrompible-ebook/9788408230663/11537354", 16.05, "€"));
    items.add(new Item.withoutId(shops[4], "https://tienda.megustaleer.com/libros/2519-dulce-chico-indecente-9788490708248.html", 16.05, "€"));
    return items;
  }
}
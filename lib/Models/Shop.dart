class Shop {
  String _id;
  String _countryId;
  String _name;
  String _logoUrl;

  Shop(this._id, this._countryId, this._name, this._logoUrl);
  Shop.withoutIds(this._name, this._logoUrl);

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get logoUrl => _logoUrl;

  set logoUrl(String logo) {
    _logoUrl = logo;
  }

  static List<Shop> getMockShops() {
    List<Shop> shops = new List();
    shops.add(Shop.withoutIds("Casa del Libro",
        "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg"));
    shops.add(Shop.withoutIds("Fnac",
        "https://upload.wikimedia.org/wikipedia/commons/2/2e/Fnac_Logo.svg"));
    shops.add(Shop.withoutIds("El corte ingles",
        "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg"));
    shops.add(Shop.withoutIds(
        "Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png"));
    shops.add(Shop.withoutIds("Me gusta leer",
        "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg"));
    return shops;
  }
}

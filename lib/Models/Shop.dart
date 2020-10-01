class Shop {
  String _id;
  String _country_id;
  String _name;
  String _logo_url;


  Shop(this._id, this._country_id, this._name, this._logo_url);
  Shop.withoutIds(this._name, this._logo_url);

  String get name => _name;

  set name(String name){
    _name = name;
  }

  String get logo_url => _logo_url;

  set logo_url(String logo){
    _logo_url = logo;
  }

}
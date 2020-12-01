import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Shop Tests', () {

    test('Get Shop Name', (){

      final shop =Shop.withoutIds("ShopName", "ShopLogoUrl");

      expect(shop.name, "ShopName");
      expect(shop.logo_url, "ShopLogoUrl");
    });

  });
}
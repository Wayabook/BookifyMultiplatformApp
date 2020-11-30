import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Shop Tests', () {
    test('Get Shop Name', (){

      final shop =Shop.withoutIds("ShopName", "ShopLogoUrl");

      expect(shop.name, "ShopName");
    });

    test('Get Shop Logo Url', (){

      final shop =Shop.withoutIds("ShopName", "ShopLogoUrl");

      expect(shop.logo_url, "ShopLogoUrl");
    });
  });
}
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bookifyapp/Design/size_constants.dart';

import '../../../../Design/SizeConfig.dart';

class ShopItemCard extends StatelessWidget {
  static const IconData GO_SHOP_ICON = Icons.arrow_forward_ios;
  Item item;
  ShopItemCard(this.item); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
      margin: new EdgeInsets.all(PADDING_FACTOR_0),
      child: Container(
        height: (CONTAINER_FACTOR_100 * SizeConfig.heightMultiplier), //100
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(
                (BORDER_RADIUS_FACTOR_7 * SizeConfig.imageSizeMultiplier)) //7
            ),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: ProfilePicture(item.shop.logo_url),
                  ),
                  Flexible(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.all(
                          (TEXT_FACTOR_12 * SizeConfig.heightMultiplier)), //12
                      child: Container(
                        //color: Colors.black,
                        //height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                item.price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kThirdDarkColor,
                                  fontSize: (TEXT_FACTOR_30_H *
                                      SizeConfig.textMultiplier),
                                ), //30
                                maxLines: 1,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                item.symbol,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kThirdDarkColor,
                                  fontSize: (TEXT_FACTOR_30_H *
                                      SizeConfig.textMultiplier),
                                ), //30
                                maxLines: 1,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: IconButton(
                                      icon: Icon(
                                        GO_SHOP_ICON,
                                        color: kThirdDarkColor,
                                        size: (ICON_FACTOR_24 *
                                            SizeConfig
                                                .imageSizeMultiplier), //24
                                      ),
                                      onPressed: () {
                                        launch(item.shop_link);
                                      },
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Design/SizeConfig.dart';

class ShopItemCard extends StatelessWidget {

  Item item;
  ShopItemCard(this.item); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (2.43 * SizeConfig.widthMultiplier), //10
      margin: new EdgeInsets.all(0),
      child:  Container(
        height: (14.64 * SizeConfig.heightMultiplier), //100
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius:  BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)) //7
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (1.21 * SizeConfig.widthMultiplier), //5
            vertical: (2.43 * SizeConfig.widthMultiplier), //10
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: ProfilePicture(item.shop.logo_url),
              ),

              Flexible(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all((1.75 * SizeConfig.heightMultiplier)), //12
                  child: Container(
                    //color: Colors.black,
                    //height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child:  AutoSizeText(
                            item.price.toString(),
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: (4.39 * SizeConfig.textMultiplier),), //30
                            maxLines: 1,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child:  AutoSizeText(
                            item.symbol,
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: (4.39 * SizeConfig.textMultiplier),), //30
                            maxLines: 1,
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: kPrimaryDarkColor,
                                size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                              ),
                              onPressed: (){
                                launch(item.shop_link);
                              },
                            )
                          ),
                        )
                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

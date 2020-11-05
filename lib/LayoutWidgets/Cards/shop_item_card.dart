import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopItemCard extends StatelessWidget {

  Item item;
  ShopItemCard(this.item); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: new EdgeInsets.fromLTRB(0, 0, 0, 0),
      child:  Container(
        height: 100,
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius:  BorderRadius.circular(7.0)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: ProfilePicture(item.shop.logo_url),
              ),

              Flexible(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
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
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
                            maxLines: 1,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child:  AutoSizeText(
                            item.symbol,
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
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

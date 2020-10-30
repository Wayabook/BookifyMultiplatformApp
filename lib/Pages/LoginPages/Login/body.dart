import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Login/background.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/already_have_an_account_acheck.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_password_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_input_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_button.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/social_icon.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/or_divider.dart';
import 'package:bookifyapp/Pages/LoginPages/Signup/singup_page.dart';
import 'package:flutter_svg/svg.dart';

import '../../first_time_form_page.dart';
import '../../main_tab_page.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/bookify_icon.png",
              height: size.height * 0.45,
            ),
            /*SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),*/
            //SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryDarkColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstTimeFormPage();
                    },
                  ),
                );
              },
            ),
            //SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

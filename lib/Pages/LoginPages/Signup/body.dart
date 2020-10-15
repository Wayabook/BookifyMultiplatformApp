import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Login/login_page.dart';
import 'package:bookifyapp/Pages/LoginPages/Signup/background.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/or_divider.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/social_icon.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/already_have_an_account_acheck.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_password_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_input_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../first_time_form_page.dart';
import '../../main_tab_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
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
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
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

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Pages/LoginPages/Signup/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Welcome/background.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/already_have_an_account_acheck.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_password_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_input_field.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/rounded_button.dart';
import 'package:bookifyapp/Pages/LoginPages/Login/login_page.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "THE BIGGEST LIBRARY ON THE NET",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: size.height * 0.05),

            Image.asset(
              "assets/icons/bookify_icon.png",
              height: size.height * 0.45,
            ),
            /*SvgPicture.asset(
              "assets/bookify_icon.png",
              height: size.height * 0.45,
            ),*/
            SizedBox(height: size.height * 0.05),

            RoundedButton(
              text: "LOGIN",
              color: kPrimaryDarkColor,
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

            RoundedButton(
              text: "SIGN UP",
              color: kSecondaryDarkColor,
              textColor: Colors.black,
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
          ],
        ),
      ),
    );
  }
}

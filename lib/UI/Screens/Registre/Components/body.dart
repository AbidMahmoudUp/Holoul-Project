import 'package:first_app/UI/Screens/Login/components/already_have_an_account.dart';
import 'package:first_app/UI/Screens/Login/components/rounded_Password_field.dart';
import 'package:first_app/UI/Screens/Login/components/rounded_input_field.dart';
import 'package:first_app/UI/Screens/Login/loginPage.dart';
import 'package:first_app/UI/Screens/Registre/Components/background.dart';
import 'package:first_app/UI/Screens/Registre/Components/or_Divider.dart';
import 'package:first_app/UI/Screens/Registre/Components/social_media_icons.dart';
import 'package:first_app/UI/Screens/Registre/RegisterInfo.dart';
import 'package:first_app/UI/Screens/Registre/SignUpScreen.dart';
import 'package:first_app/UI/Screens/roundedButton.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.3,
            ),
            RoundedInputField(HintText: 'your Email', onchanged: (value) {}),
            RoundedPasswordField(onChange: (value) {}),
            RoundedButton(
                color: kPrimeryColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterInfo();
                      },
                    ),
                  );
                },
                text: "Sign Up"),
            SizedBox(
              height: size.height * 0.02,
            ),
            AlreadyHaveAnAccount(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialMediaIcons(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialMediaIcons(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialMediaIcons(
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

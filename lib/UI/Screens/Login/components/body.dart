import 'package:first_app/UI/Screens/Homescreen/homeScreen.dart';
import 'package:first_app/UI/Screens/UserProfile/userProfileScreen.dart';
import 'package:first_app/UI/Screens/Login/components/already_have_an_account.dart';
import 'package:first_app/UI/Screens/Login/components/background.dart';
import 'package:first_app/UI/Screens/Login/components/rounded_Password_field.dart';
import 'package:first_app/UI/Screens/Login/components/rounded_input_field.dart';
import 'package:first_app/UI/Screens/Login/components/text_filed_container.dart';
import 'package:first_app/UI/Screens/Registre/SignUpScreen.dart';
import 'package:first_app/UI/Screens/roundedButton.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //responsivity
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedInputField(
              HintText: "Your Email",
              onchanged: (value) {},
            ),
            RoundedPasswordField(
              onChange: (value) {},
            ),
            RoundedButton(
                color: kPrimeryColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                text: 'Login'),
            SizedBox(
              height: size.height * 0.02,
            ),
            AlreadyHaveAnAccount(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            }),
          ], //this part is for the image and input fileds the thnigs in the middel
        ),
      ),
    );
  }
}

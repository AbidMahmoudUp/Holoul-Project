import 'package:first_app/UI/Screens/Login/loginPage.dart';
import 'package:first_app/UI/Screens/Registre/SignUpScreen.dart';
import 'package:first_app/UI/Screens/background.dart';
import 'package:first_app/UI/Screens/roundedButton.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
            // Add this line to position the image at the top
            // Add this line to position the image at the left
            // Align the child to the top left
            child: Image.asset(
              "assets/images/logo-holoul.png",
              width: size.width * 0.3 + 10,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
            width: size.width,
          ),
          SizedBox(
            height: size.height * 0.03,
            width: size.width,
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          RoundedButton(
            text: "Login",
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
            color: kPrimeryColor,
            textcolor: Colors.white,
          ),
          RoundedButton(
            text: "Registre",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            color: kprimeryLightColor,
            textcolor: kPrimeryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccount({
    super.key,
    this.login = true,
    required VoidCallback this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ?" : "Already have an Account ?",
          style: TextStyle(color: kPrimeryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(color: kPrimeryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

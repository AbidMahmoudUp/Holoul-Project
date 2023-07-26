import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textcolor;
  const RoundedButton(
      {super.key,
      required this.color,
      required this.press,
      required this.text,
      this.textcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      height: size.height * 0.08,
      margin: (EdgeInsets.symmetric(vertical: 15)),
      child: ClipRRect(
        //for the broder radius proporty we wrap the textbutton iside an ClipRRect
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              backgroundColor: color),
          onPressed: () => {press()},
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}

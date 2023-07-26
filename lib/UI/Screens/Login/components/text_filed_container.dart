import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class TextFiledContainer extends StatelessWidget {
  final Widget child;
  const TextFiledContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //responsivity
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.75,
      decoration: BoxDecoration(
          color: kprimeryLightColor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

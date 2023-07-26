import 'package:first_app/UI/Screens/Login/components/text_filed_container.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String HintText;
  final IconData icon;
  final ValueChanged<String> onchanged;
  const RoundedInputField({
    super.key,
    required this.HintText,
    this.icon = Icons.person,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFiledContainer(
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: HintText,
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: kPrimeryColor,
            )),
      ),
    );
  }
}

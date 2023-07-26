import 'package:first_app/UI/Screens/Login/components/text_filed_container.dart';
import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChange;
  const RoundedPasswordField({
    super.key,
    required this.onChange,
  });
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFiledContainer(
        child: TextField(
            obscureText: !isPasswordVisible,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              hintText: "Your Password",
              border: InputBorder.none,
              icon: Icon(
                Icons.lock,
                color: kPrimeryColor,
              ),
              suffixIcon: GestureDetector(
                onTap: togglePasswordVisibility,
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: kPrimeryColor,
                ),
              ),
            )));
  }
}

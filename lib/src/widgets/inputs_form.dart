
import 'package:flutter/material.dart';

import 'package:sgaapp/src/utils/responsive.dart';


class InputsForm extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final void Function(String text) onChanged;
  InputsForm({
    @required this.hinText,
    this.icon,
    @required this.isPassword,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      padding: EdgeInsets.only(
          top: size.iScreen(0.2),
          left: size.iScreen(1.0),
          bottom: size.iScreen(0.2),
          right: size.iScreen(0.4)),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        // controller: this.textController,
        onChanged: this.onChanged,
        autocorrect: false,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,
        decoration: InputDecoration(
            // suffixIcon: Icon(
            //   this.icon,
            //   color: Color(0xFFFF0000),
            // ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.hinText),
      ),
    );
  }
}

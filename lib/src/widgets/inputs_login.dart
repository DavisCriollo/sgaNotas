
import 'package:flutter/material.dart';

import 'package:sgaapp/src/utils/responsive.dart';


class InputsLogin extends StatelessWidget {
  final String hinText;
  final String initialValue;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
   final void Function(String text) onChanged;
   final void Function(String text) onSaved;
   final String Function(String) validator;
  InputsLogin({
    @required this.size,
    @required this.hinText,
    @required this.icon,
    @required this.isPassword,
    this.keyboardType, this.onChanged, this.validator, this.initialValue="", @required this.onSaved,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
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
      child: TextFormField(
          // controller: this.textController,
           onChanged: this.onChanged,
          initialValue: this.initialValue, 
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          onSaved:this.onSaved,
          validator:this.validator,
          decoration: InputDecoration(
              suffixIcon: Icon(
                this.icon,
                color: Color(0xFFFF0000),
                
              ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.hinText,
              )),
    );
  }
}








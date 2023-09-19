import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/sources/app_theme.dart';

typedef SecuredFieldValidator = String? Function(String? value);

class SecuredField extends StatefulWidget {
  final TextEditingController? controller;
  final SecuredFieldValidator? validator;
  final String? hintText;
  const SecuredField(
      {Key? key, this.controller, this.hintText, this.validator})
      : super(key: key);

  @override
  State<SecuredField> createState() => _SecuredFieldState();
}

class _SecuredFieldState extends State<SecuredField> {
  bool _obscureText = true;
  static  OutlineInputBorder boderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
        width: 1, color: AppTheme.greyColor),
  );


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      // style: TextStyle(fontSize: _obscureText ? 15 :10 ,letterSpacing:  _obscureText ? 0 :2 ),
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(color: Color(0xFFA3A3A3)),
        fillColor:  Colors.white,
        border:  boderStyle,
        errorBorder:  boderStyle,
        focusedErrorBorder: boderStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              width: 1, color: AppTheme.greyColor),
        ),

        hintText: widget.hintText,
        helperText: "",
        suffixIcon: GestureDetector(
          onTap: () => setState(() => _obscureText = !_obscureText),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: _obscureText ? Icon(Icons.visibility_off_outlined) :  Icon(Icons.visibility_outlined)),

        ),
      ),
      validator: widget.validator,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zen8app/utils/helpers/extendable.dart';
import 'package:zen8app/widgets/sources/secured_field.dart';

import '../../core/sources/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool enable;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String?)? callback;

  const CustomTextField(
      {Key? key,
      this.controller,
        this.enable = true,
        this.textInputType,
      this.validator,
      required this.hintText, this.callback,})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        onChanged:widget.callback ,
        keyboardType: widget.textInputType ,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.enable ? Colors.white : Color(0xFFF5F5F5),
            hintText: widget.hintText,
            helperText: "",
            hintStyle: TextStyle(color: Color(0xFFA3A3A3)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
            ) ,
            focusedErrorBorder: InputBorder.none),
        enabled: widget.enable,

        validator: widget.validator);
  }
}

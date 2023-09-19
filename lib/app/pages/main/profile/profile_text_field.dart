import 'package:flutter/cupertino.dart';

import '../../../../widgets/sources/custom_textfield.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String lable;
  final String hintText;
  final bool enable;
  final TextInputType textInputType;
  final Function(String? value)? callback;
  final String? Function(String?)? validator;

  const ProfileTextField(
      {Key? key,
      this.textInputType = TextInputType.text,
      this.enable = true,
      required this.controller,
      required this.lable,
      required this.hintText,
      this.callback,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFFA3A3A3)),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          enable: enable,
          hintText: hintText,
          controller: controller,
          textInputType: textInputType,
          callback: callback,
          validator: validator,
        )
      ],
    );
  }
}

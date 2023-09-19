import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/sources/app_theme.dart';

class CustomButton extends StatelessWidget {
  double height;
  double? width;
  String text;
  Color textColor;
  Function() onPress;
  Color btnColor;
  CustomButton(
      {Key? key,
      this.height = 56,
      this.width,
      required this.text,
      this.textColor = Colors.white,
      this.btnColor = AppTheme.primaryColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: AppTheme.textStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

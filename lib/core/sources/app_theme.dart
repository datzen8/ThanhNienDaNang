import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "SFPro"
  );
}

class AppTheme {
  AppTheme._();

  static const primaryColor = Color(0xFF0269E9);
  static const greyColor = Color(0xFFDDDDDD);
  static const deepGreyColor = Color(0xFF8A8A8A);
  static const $222222 = Color(0xFF222222);

  static TextStyle textStyle({
    Color? color = $222222,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    return TextStyle(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
  }

  static TextStyle subTitleTextStyle(){
    return TextStyle(
      color: Color(0xFF484848),
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle largeTextStyle(){
    return TextStyle(
      color: Color(0xFF484848),
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle smallTextStyle(){
    return TextStyle(
      color: Color(0xFF484848),
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }


  static TextStyle HeadingTextStyle(){
    return TextStyle(
      color: Color(0xFF484848),
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }

}

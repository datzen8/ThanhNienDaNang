import 'package:flutter/material.dart';
import 'package:zen8app/utils/utils.dart';

import '../../models/sources/option/option.dart';

extension StringExtendable on Extendable<String> {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(base);
  }

  bool isValidPhoneNumber() {
    return RegExp(
            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
        .hasMatch(base);
  }

  String remove(String reomveString){
    return base.replaceAll(reomveString,'');
  }

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  Color toColor() {
    final buffer = StringBuffer();
    if (base.length == 6 || base.length == 7) buffer.write('ff');
    buffer.write(base.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension OptionNullaleExt on Extendable<Option?> {
  String getLabel() {
    if (base == null) {
      return "";
    }
    return base!.label;
  }
}

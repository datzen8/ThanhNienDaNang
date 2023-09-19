import 'package:intl/intl.dart';
import '../helpers/extendable.dart';

extension DateTimeExtendable on Extendable<DateTime> {
  String asString(String pattern) {
    return DateFormat(pattern).format(base);
  }
}

extension DateTimeNullableExtendable on Extendable<DateTime?>{
  String asString(String pattern){
    if(base == null){
      return "";
    }
    return DateFormat(pattern).format(base!);
  }
}
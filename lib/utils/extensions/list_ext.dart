import 'dart:core';

import '../helpers/extendable.dart';

extension ListExtension<T> on Extendable<List<T>> {
  bool isEqual(List<T> compareList) {
    if (base.length != compareList.length) return false;
    for (int i = 0; i < base.length; i++) {
      if (base[i] != compareList[i]) {
        return false;
      }
    }
    return true;
  }
}

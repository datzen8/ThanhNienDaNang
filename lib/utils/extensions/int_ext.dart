import 'package:zen8app/utils/helpers/extendable.dart';

extension IntToTime on Extendable<int> {
  ///lấy thông tin giờ
  int get hour => _getHour();

  int _getHour() {
    return (base / 3600).floor();
    // return Duration(seconds: base).inHours;
  }

  ///lấy thông tin phút
  int get minute => _getMinute();

  int _getMinute() {
    return (base / 60).floor() % 60;
  }

  ///lấy thông tin giây
  int get second => _getSecond();

  int _getSecond() {
    return base % 60;
  }

  ///format hiển thị số ở hàng chục
  int get tens => _getTens();

  int _getTens() {
    if (base >= 10) {
      return ((base - (base % 10)) / 10).round();
    }
    return 0;
  }

  ///format hiển thị số ở hàng đơn vị
  int get ones => _getOnes();

  int _getOnes() {
    return base % 10;
  }
}
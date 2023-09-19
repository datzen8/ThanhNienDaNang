import 'package:dio/dio.dart';
import 'package:zen8app/utils/utils.dart';

//Do not modify
extension StreamAppExceptionConverting<T> on Stream<T> {
  Stream<AppException> asAppException() {
    return map((e) => e.ex.asAppException());
  }
}

//Configurable
class DatePattern {
  DatePattern._();

  static const yyMMyyyyHHmm = "dd/MM/yyyy";
  static const mmmddHHmm = "MMM dd, HH:mm";
  static const mmdd = 'dd/MM';
  static const HHmmssddMMyy = 'HH:mm:ss dd/MM/yyyy';
}

//Local store keys
class LocalStoreKey {
  LocalStoreKey._();

  static const credential = "credential";
  static const user = "login_response";
}

class CommonString {
  CommonString._();

  static const SIGNUP_TITLE = "Đăng kí tài khoản";
  static const user = "login_response";
}

class AppEvent {
  static const forceLogout = "logout";
  static const showAuthDialog = "showAuthDialog";
  static const setPosistion ="setPosition";
}



//App Error
enum AppExceptionType { other }

extension _AppExceptionConverting on Extendable {
  AppException asAppException() {
    if (base is AppException) {
      return base as AppException;
    }
    try {
      String? description =
          (base as DioException).response?.data["message"] as String?;
      return AppException(description: description, underlyingError: base);
    } catch (_) {
      return AppException(underlyingError: base);
    }
  }
}

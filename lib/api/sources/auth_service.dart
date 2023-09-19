import 'package:rxdart/rxdart.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/utils.dart';
import '../../models/models.dart';

class AuthService {
  Stream<LoginResponse> login(String username, String password) {
    return Session.publicClient.postStream(
      '/account/user/login/',
      data: {"username": username, "password": password ,"type": 4},
    ).decode((json) => LoginResponse.fromJson(json));
  }

  Stream<LoginResponse> register(Map<String, String> data) {
    return Session.publicClient.postStream(
      '/account/member/register/',
      data: data,
    ).decode((json) => LoginResponse.fromJson(json));
  }

  Stream<String> forgotPassword(String email) {
    if (email == "gmail@gmail.com") {
      throw AppException(description: "Không tìm thấy tài khoản");
    } else
      return Stream.value(
          "Mật khẩu mới đã được gửi đến địa chỉ email bạn sử dụng để đăng ký tài khoản.\n \nVui lòng kiểm tra hộp thư đến và làm theo hướng dẫn.");
  }

  Stream<LoginResponse> changePassword(Map<String, String> data) {
    return Session.publicClient.postStream(
      '/account/member/register/',
      data: data,
    ).decode((json) => LoginResponse.fromJson(json));
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/permission/permissions.dart';
import 'package:zen8app/models/sources/user/user.dart';

part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse {
  final String token;
  final String refreshToken;
  final String userType;
  final User user;
  final Permissions permissions;

  LoginResponse({
    required this.token,
    required this.refreshToken,
    required this.userType,
    required this.user,
    required this.permissions,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
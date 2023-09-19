// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
      userType: json['user_type'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'user_type': instance.userType,
      'user': instance.user,
      'permissions': instance.permissions,
    };

import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
class Credential {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "refresh_token")
  String refreshToken;

  Credential({
    required this.token,
    required this.refreshToken
  });

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}



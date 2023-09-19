import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String fullName;
  final String mobile;
  final String email;

  User({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
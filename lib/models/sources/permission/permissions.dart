import 'package:json_annotation/json_annotation.dart';
part 'permissions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Permissions {
  final List<String> group;


  Permissions({
    required this.group,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => _$PermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionsToJson(this);
}
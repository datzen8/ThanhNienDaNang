import 'package:json_annotation/json_annotation.dart';

import '../option/option.dart';
part 'organization.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class Organization{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<int> parentIds;
  final String title;
  final int type;
  final int level;
  final String? repEmail;
  final String? repMobile;
  final String? repName;
  final int parent;
  final int rootParent;
  final Option typeObj;
  final Option levelObj;
  final Option parentObj;
  final String fullTitle;

  Organization(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.parentIds,
      this.title,
      this.type,
      this.level,
      this.repEmail,
      this.repMobile,
      this.repName,
      this.parent,
      this.rootParent,
      this.typeObj,
      this.levelObj,
      this.parentObj,
      this.fullTitle);

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
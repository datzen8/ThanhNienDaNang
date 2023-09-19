// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      json['id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      (json['parent_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['title'] as String,
      json['type'] as int,
      json['level'] as int,
      json['rep_email'] as String?,
      json['rep_mobile'] as String?,
      json['rep_name'] as String?,
      json['parent'] as int,
      json['root_parent'] as int,
      Option.fromJson(json['type_obj'] as Map<String, dynamic>),
      Option.fromJson(json['level_obj'] as Map<String, dynamic>),
      Option.fromJson(json['parent_obj'] as Map<String, dynamic>),
      json['full_title'] as String,
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'parent_ids': instance.parentIds,
      'title': instance.title,
      'type': instance.type,
      'level': instance.level,
      'rep_email': instance.repEmail,
      'rep_mobile': instance.repMobile,
      'rep_name': instance.repName,
      'parent': instance.parent,
      'root_parent': instance.rootParent,
      'type_obj': instance.typeObj,
      'level_obj': instance.levelObj,
      'parent_obj': instance.parentObj,
      'full_title': instance.fullTitle,
    };

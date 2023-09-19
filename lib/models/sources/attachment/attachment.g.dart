// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      json['id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      json['title'] as String,
      json['url'] as String,
      json['type'] as int,
      json['campaign'] as int,
      Option.fromJson(json['type_obj'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
      'campaign': instance.campaign,
      'type_obj': instance.typeObj,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageMetadata _$ImageMetadataFromJson(Map<String, dynamic> json) =>
    ImageMetadata(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      type: json['type'] as int,
      campaign: json['campaign'] as int,
      typeObj: Option.fromJson(json['type_obj'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageMetadataToJson(ImageMetadata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
      'campaign': instance.campaign,
      'type_obj': instance.typeObj,
    };

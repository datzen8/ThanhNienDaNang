// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) => NewsDetail(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      type: json['type'] as int,
      status: json['status'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      coverImage: json['cover_image'] as String,
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int,
      categories:
          (json['categories'] as List<dynamic>).map((e) => e as int).toList(),
      categoriesObj: (json['categories_obj'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeObj: Option.fromJson(json['type_obj'] as Map<String, dynamic>),
      createdByObj:
          Option.fromJson(json['created_by_obj'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'type': instance.type,
      'status': instance.status,
      'title': instance.title,
      'content': instance.content,
      'cover_image': instance.coverImage,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'categories': instance.categories,
      'categories_obj': instance.categoriesObj,
      'type_obj': instance.typeObj,
      'created_by_obj': instance.createdByObj,
    };

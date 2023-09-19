// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as int,
      typeObj: Option.fromJson(json['type_obj'] as Map<String, dynamic>),
      content: json['content'] as String,
      coverImage: json['cover_image'] as String,
      categories:
          (json['categories'] as List<dynamic>).map((e) => e as int).toList(),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoriesObj: (json['categories_obj'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
      createdByObj:
          Option.fromJson(json['created_by_obj'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'status': instance.status,
      'type_obj': instance.typeObj,
      'content': instance.content,
      'cover_image': instance.coverImage,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'categories': instance.categories,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'categories_obj': instance.categoriesObj,
      'created_by_obj': instance.createdByObj,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) => Extra(
      types: (json['types'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'types': instance.types,
      'status': instance.status,
      'categories': instance.categories,
    };

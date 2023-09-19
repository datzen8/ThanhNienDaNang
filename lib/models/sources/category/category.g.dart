// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      value: json['value'] as int,
      label: json['label'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLeaf: json['is_leaf'] as bool,
      parentId: json['parentId'] as int?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'parentId': instance.parentId,
      'is_leaf': instance.isLeaf,
      'children': instance.children,
    };

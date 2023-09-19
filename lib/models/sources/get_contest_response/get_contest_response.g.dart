// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContestResponse _$GetContestResponseFromJson(Map<String, dynamic> json) =>
    GetContestResponse(
      Link.fromJson(json['links'] as Map<String, dynamic>),
      json['count'] as int,
      json['pages'] as int,
      json['page_size'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => Contest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetContestResponseToJson(GetContestResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'count': instance.count,
      'pages': instance.pages,
      'page_size': instance.pageSize,
      'items': instance.items,
    };

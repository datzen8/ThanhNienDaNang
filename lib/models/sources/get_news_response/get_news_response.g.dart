// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewsResponse _$GetNewsResponseFromJson(Map<String, dynamic> json) =>
    GetNewsResponse(
      links: Link.fromJson(json['links'] as Map<String, dynamic>),
      count: json['count'] as int,
      pages: json['pages'] as int,
      pageSize: json['page_size'] as int,
      extra: Extra.fromJson(json['extra'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNewsResponseToJson(GetNewsResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'count': instance.count,
      'pages': instance.pages,
      'page_size': instance.pageSize,
      'extra': instance.extra,
      'items': instance.items,
    };

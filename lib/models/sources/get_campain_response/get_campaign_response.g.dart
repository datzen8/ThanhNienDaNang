// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_campaign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCampaignResponse _$GetCampaignResponseFromJson(Map<String, dynamic> json) =>
    GetCampaignResponse(
      links: Link.fromJson(json['links'] as Map<String, dynamic>),
      extra: ExtraCampaign.fromJson(json['extra'] as Map<String, dynamic>),
      count: json['count'] as int,
      pages: json['pages'] as int,
      pageSize: json['page_size'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Campaign.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCampaignResponseToJson(
        GetCampaignResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'count': instance.count,
      'pages': instance.pages,
      'page_size': instance.pageSize,
      'extra': instance.extra,
      'items': instance.items,
    };

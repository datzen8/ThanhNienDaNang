// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_organization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOrganizationResponse _$SearchOrganizationResponseFromJson(
        Map<String, dynamic> json) =>
    SearchOrganizationResponse(
      Link.fromJson(json['links'] as Map<String, dynamic>),
      json['pages'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchOrganizationResponseToJson(
        SearchOrganizationResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'pages': instance.pages,
      'items': instance.items,
    };

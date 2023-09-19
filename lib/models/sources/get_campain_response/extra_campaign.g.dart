// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraCampaign _$ExtraCampaignFromJson(Map<String, dynamic> json) =>
    ExtraCampaign(
      beneficiaries: (json['beneficiaries'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExtraCampaignToJson(ExtraCampaign instance) =>
    <String, dynamic>{
      'beneficiaries': instance.beneficiaries,
      'types': instance.types,
    };

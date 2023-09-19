// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      json['id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      json['title'] as String,
      json['cover_image'] as String,
      json['type'] as int,
      json['content'] as String,
      json['place'] as String,
      DateTime.parse(json['registration_from'] as String),
      DateTime.parse(json['registration_to'] as String),
      json['occurring_time'] as String,
      (json['beneficiary_types'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      json['status'] as int,
      json['contact_email'] as String,
      json['contact_mobile'] as String,
      json['created_by'] as int,
      json['updated_by'] as int,
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      Option.fromJson(json['type_obj'] as Map<String, dynamic>),
      Option.fromJson(json['status_obj'] as Map<String, dynamic>),
      (json['beneficiary_types_obj'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      Option.fromJson(json['created_by_obj'] as Map<String, dynamic>),
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..files = (json['files'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'cover_image': instance.coverImage,
      'type': instance.type,
      'content': instance.content,
      'place': instance.place,
      'registration_from': instance.registrationFrom.toIso8601String(),
      'registration_to': instance.registrationTo.toIso8601String(),
      'occurring_time': instance.occurringTime,
      'beneficiary_types': instance.beneficiaryTypes,
      'status': instance.status,
      'images': instance.images,
      'contact_email': instance.contactEmail,
      'contact_mobile': instance.contactMobile,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'type_obj': instance.typeObj,
      'status_obj': instance.statusObj,
      'beneficiary_types_obj': instance.beneficiaryTypesObj,
      'created_by_obj': instance.createdByObj,
      'attachments': instance.attachments,
      'files': instance.files,
    };

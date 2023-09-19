// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMemberResponse _$ListMemberResponseFromJson(Map<String, dynamic> json) =>
    ListMemberResponse(
      Profile.fromJson(json['data'] as Map<String, dynamic>),
      ProfileOptions.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListMemberResponseToJson(ListMemberResponse instance) =>
    <String, dynamic>{
      'data': instance.profile,
      'extra': instance.listOptions,
    };

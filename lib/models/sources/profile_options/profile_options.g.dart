// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileOptions _$ProfileOptionsFromJson(Map<String, dynamic> json) =>
    ProfileOptions(
      (json['position'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['occupation'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gender'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['ethnic'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['religion'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['education_level'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['qualification'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['it_level'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['foreign_language_level'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['political_theory_level'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileOptionsToJson(ProfileOptions instance) =>
    <String, dynamic>{
      'position': instance.position,
      'occupation': instance.occupation,
      'gender': instance.gender,
      'ethnic': instance.ethnic,
      'religion': instance.religion,
      'education_level': instance.educationLevel,
      'qualification': instance.qualification,
      'it_level': instance.itLevel,
      'foreign_language_level': instance.foreignLanguageLevel,
      'political_theory_level': instance.politicalTheoryLevel,
    };

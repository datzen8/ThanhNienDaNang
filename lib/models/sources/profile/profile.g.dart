// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      ethnic: json['ethnic'] as int?,
      religion: json['religion'] as int?,
      educationLevel: json['education_level'] as int?,
      qualification: json['qualification'] as int?,
      itLevel: json['it_level'] as int?,
      foreignLanguageLevel: json['foreign_language_level'] as int?,
      politicalTheoryLevel: json['political_theory_level'] as int?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      placeOfOrigin: json['place_of_origin'] as String,
      placeOfResidence: json['place_of_residence'] as String,
      fullName: json['full_name'] as String,
      joinedDate: json['joined_date'] == null
          ? null
          : DateTime.parse(json['joined_date'] as String),
      gender: json['gender'] as int?,
      idNumber: json['id_number'] as String? ?? "",
      idIssuedDate: json['id_issued_date'] == null
          ? null
          : DateTime.parse(json['id_issued_date'] as String),
      idIssuedPlace: json['id_issued_place'] as String? ?? "",
      user: json['user'] as int,
      position: json['position'] as int?,
      occupation: json['occupation'] as int?,
      organization: json['organization'] as int?,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      positionObj: json['position_obj'] == null
          ? null
          : Option.fromJson(json['position_obj'] as Map<String, dynamic>),
      occupationObj: json['occupation_obj'] == null
          ? null
          : Option.fromJson(json['occupation_obj'] as Map<String, dynamic>),
      organizationObj: json['organization_obj'] == null
          ? null
          : Option.fromJson(json['organization_obj'] as Map<String, dynamic>),
      ethnicObj: json['ethnic_obj'] == null
          ? null
          : Option.fromJson(json['ethnic_obj'] as Map<String, dynamic>),
      religionObj: json['religion_obj'] == null
          ? null
          : Option.fromJson(json['religion_obj'] as Map<String, dynamic>),
      educationLevelObj: json['education_level_obj'] == null
          ? null
          : Option.fromJson(
              json['education_level_obj'] as Map<String, dynamic>),
      qualificationObj: json['qualification_obj'] == null
          ? null
          : Option.fromJson(json['qualification_obj'] as Map<String, dynamic>),
      itLevelObj: json['it_level_obj'] == null
          ? null
          : Option.fromJson(json['it_level_obj'] as Map<String, dynamic>),
      foreignLanguageLevelObj: json['foreign_language_level_obj'] == null
          ? null
          : Option.fromJson(
              json['foreign_language_level_obj'] as Map<String, dynamic>),
      politicalTheoryLevelObj: json['political_theory_level_obj'] == null
          ? null
          : Option.fromJson(
              json['political_theory_level_obj'] as Map<String, dynamic>),
      genderObj: json['gender_obj'] == null
          ? null
          : Option.fromJson(json['gender_obj'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'ethnic': instance.ethnic,
      'religion': instance.religion,
      'education_level': instance.educationLevel,
      'qualification': instance.qualification,
      'it_level': instance.itLevel,
      'foreign_language_level': instance.foreignLanguageLevel,
      'political_theory_level': instance.politicalTheoryLevel,
      'dob': instance.dob?.toIso8601String(),
      'place_of_origin': instance.placeOfOrigin,
      'place_of_residence': instance.placeOfResidence,
      'full_name': instance.fullName,
      'joined_date': instance.joinedDate?.toIso8601String(),
      'gender': instance.gender,
      'id_number': instance.idNumber,
      'id_issued_date': instance.idIssuedDate?.toIso8601String(),
      'id_issued_place': instance.idIssuedPlace,
      'user': instance.user,
      'position': instance.position,
      'occupation': instance.occupation,
      'organization': instance.organization,
      'email': instance.email,
      'mobile': instance.mobile,
      'position_obj': instance.positionObj,
      'occupation_obj': instance.occupationObj,
      'organization_obj': instance.organizationObj,
      'ethnic_obj': instance.ethnicObj,
      'religion_obj': instance.religionObj,
      'education_level_obj': instance.educationLevelObj,
      'qualification_obj': instance.qualificationObj,
      'it_level_obj': instance.itLevelObj,
      'foreign_language_level_obj': instance.foreignLanguageLevelObj,
      'political_theory_level_obj': instance.politicalTheoryLevelObj,
      'gender_obj': instance.genderObj,
    };

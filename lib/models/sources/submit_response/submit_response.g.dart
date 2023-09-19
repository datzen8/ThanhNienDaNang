// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitResponse _$SubmitResponseFromJson(Map<String, dynamic> json) =>
    SubmitResponse(
      json['id'] as int,
      Contest.fromJson(json['contest'] as Map<String, dynamic>),
      Exam.fromJson(json['exam'] as Map<String, dynamic>),
      Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitResponseToJson(SubmitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contest': instance.contest,
      'exam': instance.exam,
      'result': instance.result,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      json['id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      json['score'] as int,
      json['submitted_at'] == null
          ? null
          : DateTime.parse(json['submitted_at'] as String),
      DateTime.parse(json['started_at'] as String),
      DateTime.parse(json['finished_at'] as String),
      json['member'] as int,
      json['contest'] as int,
      Option.fromJson(json['member_obj'] as Map<String, dynamic>),
      (json['contest_obj'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'score': instance.score,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'started_at': instance.startedAt.toIso8601String(),
      'finished_at': instance.finishedAt.toIso8601String(),
      'member': instance.member,
      'contest': instance.contest,
      'member_obj': instance.memberObj,
      'contest_obj': instance.contestObj,
      'questions': instance.questions,
    };

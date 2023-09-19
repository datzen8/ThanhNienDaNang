// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      DateTime.parse(json['started_at'] as String),
      DateTime.parse(json['submitted_at'] as String),
      json['number_of_correct_answers'] as int,
      json['number_of_questions'] as int,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'started_at': instance.startedAt.toIso8601String(),
      'submitted_at': instance.submittedAt.toIso8601String(),
      'number_of_questions': instance.numberOfQuestions,
      'number_of_correct_answers': instance.numberOfCorrectAnswers,
    };

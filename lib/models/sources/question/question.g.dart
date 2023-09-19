// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['id'] as int,
      json['type'] as int,
      json['content'] as String,
      json['exam'] as int,
      (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['correct_answers'] as List<dynamic>).map((e) => e as int).toList(),
      (json['submitted_answers'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'exam': instance.exam,
      'answers': instance.answers,
      'correct_answers': instance.correctAnswers,
      'submitted_answers': instance.submittedAnswers,
    };

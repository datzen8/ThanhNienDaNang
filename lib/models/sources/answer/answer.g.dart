// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['id'] as int,
      json['content'] as String,
      json['correct'] as bool,
      json['order'] as int,
      json['exam_question'] as int,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'correct': instance.correct,
      'order': instance.order,
      'exam_question': instance.examQuestion,
    };

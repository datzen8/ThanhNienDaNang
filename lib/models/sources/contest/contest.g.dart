// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contest _$ContestFromJson(Map<String, dynamic> json) => Contest(
      id: json['id'] as int,
      title: json['title'] as String,
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      organizationalUnit: json['organizational_unit'] as String,
      coverImage: json['cover_image'] as String,
      numberOfQuestion: json['number_of_question'] as int,
      description: json['description'] as String,
      duration: json['duration'] as int,
      minScore: json['min_score'] as int,
      startAt: DateTime.parse(json['start_at'] as String),
      endAt: DateTime.parse(json['end_at'] as String),
      status: json['status'] as int,
      statusObj: Option.fromJson(json['status_obj'] as Map<String, dynamic>),
      createdByObj:
          Option.fromJson(json['created_by_obj'] as Map<String, dynamic>),
      updatedByObj:
          Option.fromJson(json['updated_by_obj'] as Map<String, dynamic>),
      submittedAt: json['submitted_at'] == null
          ? null
          : DateTime.parse(json['submitted_at'] as String),
      examId: json['exam_id'] as int?,
      numberOfQuestions: json['number_of_questions'] as int,
      contestOrganizer: json['contest_organizer'] as String?,
      participants: json['participants'] as int,
    );

Map<String, dynamic> _$ContestToJson(Contest instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'uid': instance.uid,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'organizational_unit': instance.organizationalUnit,
      'cover_image': instance.coverImage,
      'number_of_question': instance.numberOfQuestion,
      'description': instance.description,
      'duration': instance.duration,
      'min_score': instance.minScore,
      'start_at': instance.startAt.toIso8601String(),
      'end_at': instance.endAt.toIso8601String(),
      'contest_organizer': instance.contestOrganizer,
      'status': instance.status,
      'status_obj': instance.statusObj,
      'created_by_obj': instance.createdByObj,
      'updated_by_obj': instance.updatedByObj,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'exam_id': instance.examId,
      'number_of_questions': instance.numberOfQuestions,
      'participants': instance.participants,
    };

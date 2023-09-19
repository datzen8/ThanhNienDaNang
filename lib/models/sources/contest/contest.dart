import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/option/option.dart';
import 'package:zen8app/utils/utils.dart';
part 'contest.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Contest {
  int id;
  String title;
  String uid;
  DateTime createdAt;
  DateTime updatedAt;
  String organizationalUnit;
  String coverImage;
  int numberOfQuestion;
  String description;
  int duration;
  int minScore;
  DateTime startAt;
  DateTime endAt;
  String? contestOrganizer;
  int status;
  Option statusObj;
  Option createdByObj;
  Option updatedByObj;
  DateTime? submittedAt;
  int? examId;
  int numberOfQuestions;
  int participants;

  Contest(
      {required this.id,
      required this.title,
      required this.uid,
      required this.createdAt,
      required this.updatedAt,
      required this.organizationalUnit,
      required this.coverImage,
      required this.numberOfQuestion,
      required this.description,
      required this.duration,
      required this.minScore,
      required this.startAt,
      required this.endAt,
      required this.status,
      required this.statusObj,
      required this.createdByObj,
      required this.updatedByObj,
      this.submittedAt,
      this.examId,
      required this.numberOfQuestions,
      this.contestOrganizer,
      required this.participants});

  factory Contest.fromJson(Map<String, dynamic> json) =>
      _$ContestFromJson(json);
  Map<String, dynamic> toJson() => _$ContestToJson(this);

  String get participantsToString =>
      "${this.participants.toString()} người tham gia";

  String get occuringTime =>
      "Từ ngày ${this.startAt.ex.asString(DatePattern.mmdd)} đến ${this.endAt.ex.asString(DatePattern.mmdd)}";
}

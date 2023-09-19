import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/option/option.dart';
import '../question/question.dart';
part 'exam.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Exam{
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int score;
  DateTime? submittedAt;
  DateTime startedAt;
  DateTime finishedAt;
  int member;
  int contest;
  Option memberObj;
  List<Option> contestObj;
  List<Question> questions;

  Exam(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.score,
      this.submittedAt,
      this.startedAt,
      this.finishedAt,
      this.member,
      this.contest,
      this.memberObj,
      this.contestObj,
      this.questions);

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
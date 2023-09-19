import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/option/option.dart';

import '../question/question.dart';
part 'create_exam_response.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class CreateExamResponse{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int score;
  final DateTime? submittedAt;
  final DateTime startedAt;
  final DateTime finishedAt;
  final int member;
  final int contest;
  final Option memberObj;
  final List<Option> contestObj;
  final List<Question> question;

  CreateExamResponse(
      this.question,
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
      this.contestObj);
}
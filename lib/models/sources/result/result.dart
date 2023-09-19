
import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Result{
  final DateTime startedAt;
  final DateTime submittedAt;
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  Result(this.startedAt, this.submittedAt, this.numberOfCorrectAnswers, this.numberOfQuestions);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
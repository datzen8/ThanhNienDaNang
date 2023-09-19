import 'package:json_annotation/json_annotation.dart';

import '../answer/answer.dart';
part 'question.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Question {
  int id;
  int type;
  String content;
  int exam;
  List<Answer> answers;
  List<int> correctAnswers;
  List<int> submittedAnswers;

  Question(this.id, this.type, this.content, this.exam, this.answers,
      this.correctAnswers, this.submittedAnswers);

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

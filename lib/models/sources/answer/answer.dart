
import 'package:json_annotation/json_annotation.dart';
part 'answer.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Answer{
  final int id;
  final String content;
  final bool correct;
  final int order;
  final int examQuestion;

  Answer(this.id, this.content, this.correct, this.order, this.examQuestion);


  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);

}
import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/result/result.dart';

import '../contest/contest.dart';
import '../exam/exam.dart';
part 'submit_response.g.dart';

@JsonSerializable()
class SubmitResponse{
 int id;
 Contest contest;
 Exam exam;
 Result result;

 SubmitResponse(this.id, this.contest, this.exam, this.result);
 factory SubmitResponse.fromJson(Map<String, dynamic> json) => _$SubmitResponseFromJson(json);
 Map<String, dynamic> toJson() => _$SubmitResponseToJson(this);

}
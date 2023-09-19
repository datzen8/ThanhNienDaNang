import 'package:json_annotation/json_annotation.dart';
part 'interact_by.g.dart';

@JsonSerializable()
class CreatedBy {
  final int id;
  final String fullName;

  CreatedBy({required this.id, required this.fullName});
  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
  
}
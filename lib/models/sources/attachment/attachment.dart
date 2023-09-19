import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/option/option.dart';

part 'attachment.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Attachment{
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String url;
  int type;
  int campaign;
  Option typeObj;

  Attachment(this.id, this.createdAt, this.updatedAt, this.title, this.url,
      this.type, this.campaign, this.typeObj);

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
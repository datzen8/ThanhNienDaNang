import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/option/option.dart';

part 'news_detail.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class NewsDetail {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int type;
  final int status;
  final String title;
  final String content;
  final String coverImage;
  final int createdBy;
  final int updatedBy;
  final List<int> categories;
  final List<Option> categoriesObj;
  final Option typeObj;
  final Option createdByObj;

  NewsDetail({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.status,
    required this.title,
    required this.content,
    required this.coverImage,
    required this.createdBy,
    required this.updatedBy,
    required this.categories,
    required this.categoriesObj,
    required this.typeObj,
    required this.createdByObj,
  });

  factory NewsDetail.fromJson(Map<String, dynamic> json) => _$NewsDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailToJson(this);

}
import 'package:json_annotation/json_annotation.dart';
import '../category/category.dart';
import '../interact_by/interact_by.dart';
import '../option/option.dart';

part 'news.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class News {
  final int id;
  final String title;
  final int type;
  final int status;
  final Option typeObj;
  final String content;
  final String coverImage;
  final int createdBy;
  final int updatedBy;
  final List<int> categories;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Option> categoriesObj;
  final Option createdByObj;

  News({
    required this.id,
    required this.title,
    required this.type,
    required this.typeObj,
    required this.content,
    required this.coverImage,
    required this.categories,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.categoriesObj,
    required this.status,
    required this.createdByObj,
  });
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

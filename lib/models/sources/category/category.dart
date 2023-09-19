import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int value;
  final String label;
  final int? parentId;
  @JsonKey(name: "is_leaf")
  final bool isLeaf;
  final List<Category> children;

  Category({required this.value, required this.label, required this.children, required this.isLeaf, required this.parentId});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
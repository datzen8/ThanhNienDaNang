import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/option/option.dart';

import '../category/category.dart';
part 'extra.g.dart';

@JsonSerializable()
class Extra {
  final List<Option> types;
  final List<Option> status;
  final List<Category> categories;

  Extra({required this.types, required this.categories, required this.status});

  factory Extra.fromJson(Map<String, dynamic> json) {
    var newJson = json["options"];
    return Extra(
      types: (newJson['types'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (newJson['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (newJson['status'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../option/option.dart';
part 'image_metadata.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageMetadata {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String title;
  final String url;
  final int type;
  final int campaign;
  final Option typeObj;

  ImageMetadata({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.url,
    required this.type,
    required this.campaign,
    required this.typeObj,
  });

  factory ImageMetadata.fromJson(Map<String, dynamic> json) => _$ImageMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageMetadataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option{
  String label;
  int value;

  Option(this.label, this.value);

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
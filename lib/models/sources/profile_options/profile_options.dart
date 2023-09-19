import 'package:json_annotation/json_annotation.dart';

import '../option/option.dart';
part 'profile_options.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileOptions {
  List<Option> position;
  List<Option> occupation;
  List<Option> gender;
  List<Option> ethnic;
  List<Option> religion;
  List<Option> educationLevel;
  List<Option> qualification;
  List<Option> itLevel;
  List<Option> foreignLanguageLevel;
  List<Option> politicalTheoryLevel;

  ProfileOptions(
      this.position,
      this.occupation,
      this.gender,
      this.ethnic,
      this.religion,
      this.educationLevel,
      this.qualification,
      this.itLevel,
      this.foreignLanguageLevel,
      this.politicalTheoryLevel);

  factory ProfileOptions.fromJson(Map<String, dynamic> json) {
    var newJson = json['options'];

    return ProfileOptions(
        (newJson['position'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['occupation'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['gender'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['ethnic'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['religion'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['education_level'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['qualification'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['it_level'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['foreign_language_level'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        (newJson['political_theory_level'] as List<dynamic>)
            .map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList());
  }
  Map<String, dynamic> toJson() => _$ProfileOptionsToJson(this);
}

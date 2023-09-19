import 'package:json_annotation/json_annotation.dart';

import '../category/category.dart';
import '../option/option.dart';
part 'extra_campaign.g.dart';
@JsonSerializable()
class ExtraCampaign{
  List<Option> beneficiaries;
  List<Option> types;

  ExtraCampaign({required this.beneficiaries, required this.types});

  factory ExtraCampaign.fromJson(Map<String, dynamic> json) {
    var newJson = json["options"];
    return ExtraCampaign(
      types: (newJson['types'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      beneficiaries: (newJson['beneficiaries'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),

    );
  }
  Map<String, dynamic> toJson() => _$ExtraCampaignToJson(this);


}
import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/extra/extra.dart';
import 'package:zen8app/models/sources/get_campain_response/extra_campaign.dart';
import 'package:zen8app/models/sources/link/link.dart';

import '../campaign/campaign.dart';

part 'get_campaign_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetCampaignResponse {
  Link links;
  int count;
  int pages;
  int pageSize;
  ExtraCampaign extra;
  List<Campaign> items;

  GetCampaignResponse(
      {required this.links,
      required this.extra,
      required this.count,
      required this.pages,
      required this.pageSize,
      required this.items});

  factory GetCampaignResponse.fromJson(Map<String, dynamic> json) => _$GetCampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCampaignResponseToJson(this);
}

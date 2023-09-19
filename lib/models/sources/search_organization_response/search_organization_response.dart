import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/link/link.dart';

import '../organization/organization.dart';
part 'search_organization_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchOrganizationResponse {
  Link links;
  int pages;
  List<Organization> items;

  SearchOrganizationResponse(this.links, this.pages, this.items);

  factory SearchOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchOrganizationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchOrganizationResponseToJson(this);
}

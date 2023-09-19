import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/models/sources/profile/profile.dart';
import 'package:zen8app/models/sources/profile_options/profile_options.dart';
part 'get_list_member_response.g.dart';

@JsonSerializable()
class ListMemberResponse{
  @JsonKey(name: "data")
  Profile profile;
  @JsonKey(name: "extra" )
  ProfileOptions listOptions;

  ListMemberResponse(this.profile, this.listOptions);

  factory ListMemberResponse.fromJson(Map<String, dynamic> json) => _$ListMemberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListMemberResponseToJson(this);
}
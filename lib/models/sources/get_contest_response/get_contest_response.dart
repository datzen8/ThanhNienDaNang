import 'package:json_annotation/json_annotation.dart';

import '../contest/contest.dart';
import '../link/link.dart';
part 'get_contest_response.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class GetContestResponse{
  Link links;
  int count;
  int pages;
  int pageSize;
  List<Contest> items;

  GetContestResponse(
      this.links, this.count, this.pages, this.pageSize, this.items);

  factory GetContestResponse.fromJson(Map<String, dynamic> json) => _$GetContestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetContestResponseToJson(this);
}
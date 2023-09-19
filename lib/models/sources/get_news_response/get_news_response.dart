import 'package:json_annotation/json_annotation.dart';
import '../extra/extra.dart';
import '../link/link.dart';
import '../news/news.dart';

part 'get_news_response.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class GetNewsResponse {
  Link links;
  int count;
  int pages;
  int pageSize;
  Extra extra;
  List<News> items;

  GetNewsResponse(
      {required this.links,
      required this.count,
      required this.pages,
      required this.pageSize,
      required this.extra,
      required this.items});


  factory GetNewsResponse.fromJson(Map<String, dynamic> json) => _$GetNewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetNewsResponseToJson(this);
}

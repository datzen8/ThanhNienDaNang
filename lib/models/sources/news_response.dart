import 'package:zen8app/models/sources/link/link.dart';

import 'extra/extra.dart';
import 'news/news.dart';

class ApiResponse {
  final Link links;
  final int count;
  final int pages;
  final int pageSize;
  final Extra extra;
  final List<News> items;

  ApiResponse({
    required this.links,
    required this.count,
    required this.pages,
    required this.pageSize,
    required this.extra,
    required this.items,
  });

}





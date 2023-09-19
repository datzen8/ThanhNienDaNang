import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/news_item.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/news/news.dart';

class NewsSection extends StatefulWidget {
  final List<News> lisNews;
  const NewsSection({Key? key, required this.lisNews}) : super(key: key);

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Tin tức mới",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "images/arrow-circle-right.png",
                height: 16,
                width: 16,
                fit: BoxFit.fitHeight,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...widget.lisNews.map((e) => NewsItem(news: e)),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/utils/extensions/date_time_ext.dart';
import 'package:zen8app/utils/helpers/extendable.dart';

import '../../core/sources/app_theme.dart';
import '../../core/sources/common.dart';
import '../../models/sources/news/news.dart';
import '../../router/router.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushRoute(NewsDetailRoute(id: news.id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 65,
                      width: 96,
                      fit: BoxFit.cover, imageUrl: news.coverImage,
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: AppTheme.deepGreyColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          news.createdAt.ex.asString(DatePattern.yyMMyyyyHHmm),
                          style: TextStyle(
                            color: AppTheme.deepGreyColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

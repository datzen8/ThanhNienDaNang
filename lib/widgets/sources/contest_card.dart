import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/widgets/sources/tag.dart';

import '../../core/sources/app_theme.dart';
import '../../models/sources/contest/contest.dart';




class ContestCard  extends  StatelessWidget {
  final Contest contest;
  const ContestCard ({Key? key, required this.contest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ContestDetailRoute(id: contest.id));
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 20) / 2,
        child: Card(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: contest.coverImage,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 8,
                      left: 8,
                      child: Tag(
                        backgroundColor: Color(0xFF00B191),
                        title: contest.participantsToString,
                        pathIcon:"images/white-users.png",
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                        height: 60,
                        child: Text(
                          contest.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14,),maxLines:3 ,
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: AppTheme.deepGreyColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                         contest.occuringTime,
                          style: TextStyle(
                            color: AppTheme.deepGreyColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Image.asset('images/grey-clock.png',height: 12,width: 12,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          contest.duration.toString()+ " phút",
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
            ],
          ),
        ),
      ),
    );
  }
}

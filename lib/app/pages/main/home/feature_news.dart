import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/app/pages/main/home/home_content.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/news/news.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/widgets/sources/default_network_image.dart';
import 'package:zen8app/widgets/sources/tag.dart';

class FeatureNews extends StatefulWidget {
  final List<News> news;
  const FeatureNews({Key? key, required this.news}) : super(key: key);

  @override
  State<FeatureNews> createState() => _FeatureNewsState();
}

class _FeatureNewsState extends State<FeatureNews> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(

        carouselController: buttonCarouselController,
        items: widget.news.map((e) {
          return GestureDetector(
            onTap: (){
              context.router.push(NewsDetailRoute(id: e.id));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: DefaultNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          fit: BoxFit.fitWidth,
                          imageUrl: e.coverImage,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: Tag(
                          backgroundColor: Color(0xFF00A9F1),
                          title: "Tin nổi bật",
                          pathIcon: "images/white-start.png",
                        ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    e.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.clip),
                  ),
                )
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            viewportFraction: 1,
            height: 200,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            padEnds: false,
            enlargeCenterPage: false),
      ),
      Positioned(
        top: 95,
        left: MediaQuery.of(context).size.width/2 - widget.news.length*10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.news.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => buttonCarouselController.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current != entry.key
                            ? Colors.white
                            : AppTheme.primaryColor)

              ),
            );
          }).toList(),
        ),
      )
    ]);
  }
}

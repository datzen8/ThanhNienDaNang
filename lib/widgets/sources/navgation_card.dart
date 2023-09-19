import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen8app/router/router.dart';

enum ButtonCategory {
  campaign,
  contest,
  news,
  profile;

  String get name {
    return switch (this) {
      ButtonCategory.campaign => "Tình nguyện",
      ButtonCategory.contest => "Cuộc thi",
      ButtonCategory.news => "Tin tức",
      ButtonCategory.profile => "Cá nhân",
    };
  }

  String get imgUrl {
    return switch (this) {
      ButtonCategory.campaign => "images/blood.png",
      ButtonCategory.contest => "images/stage.png",
      ButtonCategory.news => "images/news.png",
      ButtonCategory.profile => "images/photo.png",
    };
  }

  PageRouteInfo get page {
    return switch (this) {
      ButtonCategory.campaign => CampaignRoute(),
      ButtonCategory.contest => CampaignRoute(),
      ButtonCategory.news => NewsRoute(),
      ButtonCategory.profile => PersonalRoute(),
    };
  }
}

class NavigationCard extends StatefulWidget {
  final bool isLogin;
  const NavigationCard({Key? key, required this.isLogin}) : super(key: key);

  @override
  State<NavigationCard> createState() => _NavigationCardState();
}

class _NavigationCardState extends State<NavigationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        // Adds a rounded rectangular border to the card
        borderRadius: BorderRadius.circular(10.0),
        //
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) => index).map((e) {
              ButtonCategory currentBtn = ButtonCategory.values[e];
              return _buildNavgatorItem(
                  page: currentBtn.page,
                  imageUrl: currentBtn.imgUrl,
                  name: currentBtn.name);
            }).toList()),
      ),
    );
  }

  Widget _buildNavgatorItem(
      {required PageRouteInfo page,
      required String name,
      required String imageUrl}) {
    return InkWell(
      onTap: () {
        context.router.push(page);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.21,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(240, 246, 253, 0.9)),

            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

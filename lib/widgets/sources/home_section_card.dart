import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/campaign/campaign.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/tag.dart';

enum CampaignType {
  hm,
  gdng,
  gd,
  tc;

  String get title {
    return switch (this) {
      CampaignType.hm => "Hiến máu",
      CampaignType.gdng => "Giúp đỡ người già",
      CampaignType.gd => "Giảng dạy",
      CampaignType.tc => "Trồng cây",
    };
  }

  String get pathIcon {
    return switch (this) {
      CampaignType.hm => "images/white-blood-donation.png",
      CampaignType.gdng => "images/white-old-people.png",
      CampaignType.gd => "images/white-open-book.png",
      CampaignType.tc => "images/white-tree-deciduous.png",
    };
  }
}

class SectionCard extends StatefulWidget {
  final Campaign campaign;
  const SectionCard({Key? key, required this.campaign}) : super(key: key);

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(CampaignDetailRoute(id: widget.campaign.id));
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 20) / 2,
        child: Card(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.campaign.coverImage,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 8,
                      left: 8,
                      child: Tag(
                        backgroundColor: Color(0xFF00B191),
                        title: widget.campaign.typeObj.label,
                        pathIcon: CampaignType.values[widget.campaign.type-1].pathIcon,
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
                          widget.campaign.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
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
                          widget.campaign.formatOccurrringTime(),
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

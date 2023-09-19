import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zen8app/app/pages/main/campaign/campaign_page.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/widgets/sources/home_section_card.dart';

import '../../../../models/sources/campaign/campaign.dart';

class HomeContentSection extends StatefulWidget {
  final List<Campaign> campaigns;
  const HomeContentSection({Key? key, required this.campaigns}) : super(key: key);

  @override
  State<HomeContentSection> createState() => _HomeContentSectionState();
}

class _HomeContentSectionState extends State<HomeContentSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            context.router.push(CampaignRoute());
          },
          child: Row(
            children: [
              Text("Đợt tình nguyện",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
              SizedBox(width: 10,),
              Image.asset("images/arrow-circle-right.png",height: 16 ,width: 16,fit: BoxFit.fitHeight,),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 243,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.campaigns.length,
            padding: EdgeInsets.only(right: 10),
            itemBuilder:(context, index) => SectionCard(campaign: widget.campaigns[index]),),
        )
      ],
    );
  }
}

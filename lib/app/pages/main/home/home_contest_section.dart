import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zen8app/models/sources/contest/contest.dart';
import 'package:zen8app/widgets/sources/contest_card.dart';

class HomeContestSection extends StatefulWidget {
  final List<Contest> contests;
  const HomeContestSection({Key? key, required this.contests}) : super(key: key);

  @override
  State<HomeContestSection> createState() => _HomeContestSectionState();
}

class _HomeContestSectionState extends State<HomeContestSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            // context.router.push(CampaignRoute());
          },
          child: Row(
            children: [
              Text("Cuộc thi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
              SizedBox(width: 10,),
              Image.asset("images/arrow-circle-right.png",height: 16 ,width: 16,fit: BoxFit.fitHeight,),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 263,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.contests.length,
            padding: EdgeInsets.only(right: 10),
            itemBuilder:(context, index) => ContestCard(contest:widget.contests[index]),
        ))
      ],
    );
  }
}

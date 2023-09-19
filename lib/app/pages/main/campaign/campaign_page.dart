import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/app/pages/main/campaign/campaign_list_page.dart';

import '../../../../core/sources/app_theme.dart';

enum CampaignStatus {
  upcomming,
  happenning,
  finished;

  String get name {
    return switch (this) {
      CampaignStatus.upcomming => "Sắp diễn ra",
      CampaignStatus.happenning => "Đang diễn ra",
      CampaignStatus.finished => "Đã kết thúc",
    };
  }

  int get value{
    return switch (this) {
    CampaignStatus.upcomming => 1,
    CampaignStatus.happenning => 2,
    CampaignStatus.finished => 3,
  };
  }
}

@RoutePage()
class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  CampaignStatus _currentCampaignStatus = CampaignStatus.upcomming;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: 3, animationDuration: Duration(milliseconds: 500))
      ..addListener(() {
        _selectedIndex = _tabController.index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            elevation: 0.2,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Đợt tình nguyện",
              style: AppTheme.textStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
                controller: _tabController,
                padding: EdgeInsets.symmetric(horizontal: 10),
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                indicator: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: List.generate(_tabController.length, (index) => index)
                    .map(
                      (e) => Tab(child: Text(CampaignStatus.values[e].name)),
                    )
                    .toList()),
          ),
          body: TabBarView(
              controller: _tabController,
              children: List.generate(_tabController.length, (index) => index)
                  .map(
                      (e) => CampaignListPage(
                          key: ValueKey(e),
                          status: CampaignStatus.values[e]))
                  .toList())
    );
  }
}

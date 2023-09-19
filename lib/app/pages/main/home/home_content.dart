import 'package:flutter/cupertino.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/home/feature_news.dart';
import 'package:zen8app/app/pages/main/home/home_content_section.dart';
import 'package:zen8app/app/pages/main/home/home_contest_section.dart';
import 'package:zen8app/app/pages/main/home/home_vm.dart';
import 'package:zen8app/app/pages/main/home/news_sections.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/campaign/campaign.dart';
import 'package:zen8app/models/sources/extra/extra.dart';
import 'package:zen8app/models/sources/news/news.dart';
import 'package:zen8app/models/sources/option/option.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/facebook_launch_widget.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import '../../../../models/sources/contest/contest.dart';
import '../../../../models/sources/interact_by/interact_by.dart';

News feature_news = News(
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    id: 1,
    content: "adadddasddada",
    title:
        'Tuổi trẻ Đà Nẵng sôi nổi cùng các hoạt động hỗ trợ “Tiếp sức mùa thi 2023”',
    categories: [],
    coverImage: '',
    createdBy: 1,
    type: 1,
    typeObj: Option("da", 1),
    updatedBy: 1,
    categoriesObj: [],
    status: 1,
    createdByObj: Option("dd", 1));

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({Key? key}) : super(key: key);

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage>
    with MVVMBinding<HomeVM, HomeContentPage> {
  var _normalNews = <News>[];
  var _featureNews = <News>[];
  var _campaigns = <Campaign>[];
  var _contests =  <Contest>[];

  void reload() {
    vm.input.loadNormalPost.add(null);
    vm.input.loadFeaturePost.add(null);
    vm.input.loadCampaign.add(null);
    vm.input.loadContest.add(null);
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.getNormalNews.listen((res) {
      setState(() {
        _normalNews = res.items;
      });
    }).addTo(subscription);

    vm.output.getFeatureNews.listen((value) {
      _featureNews = value.items;
    }).addTo(subscription);

    vm.output.getCampaign.listen((value) {
      _campaigns = value.items;
    }).addTo(subscription);


    vm.output.getContest.listen((value) {
      _contests = value.items;
    }).addTo(subscription);


    reload();
  }

  @override
  HomeVM onCreateVM() {
    return HomeVM();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      error: vm.errorTracker.asAppException(),
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, bottom: 30),
        child: Column(
          children: [
            FeatureNews(news: _featureNews),
            SizedBox(
              height: 20,
            ),
            HomeContentSection(campaigns: _campaigns),
            SizedBox(
              height: 20,
            ),
            HomeContestSection(contests: _contests),
            SizedBox(
              height: 20,
            ),
            FacebookLaunch(),
            SizedBox(
              height: 20,
            ),
            NewsSection(lisNews: _normalNews),
          ],
        ),
      ),
    );
  }
}

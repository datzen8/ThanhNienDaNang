import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/news/news_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/helpers/mvvm_binding.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import 'package:zen8app/widgets/sources/news_item.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/news/news.dart';
import '../../../../router/router.dart';
import '../home/feature_news.dart';
import '../home/news_sections.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with MVVMBinding<NewsVM, NewsPage> {
  var _normalNews = <News>[];
  var _featureNews = <News>[];

  void reload() {
    vm.input.loadNormalPost.add(null);
    vm.input.loadFeaturePost.add(null);
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.getFeatureNews.listen((value) {
      setState(() {
        _featureNews = value.items;
      });
    }).addTo(subscription);

    vm.output.getNormalNews.listen((value) {
      setState(() {
        _normalNews = value.items;
      });
    }).addTo(subscription);

    reload();
  }

  @override
  NewsVM onCreateVM() {
    return NewsVM();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget.builder(
      error: vm.errorTracker.asAppException(),
      isLoading: vm.activityTracker.isRunningAny(),
      refreshController: RefreshController(
        onLoad: vm.loadMore,
        onRefresh: vm.refresh,
        refreshOnStart: true,
      ),
      builder: (context, physics) => Scaffold(
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
          actions: [
            GestureDetector(
              onTap: () {
                context.router.push(ListNewCategoryRoute());
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'images/category.png',
                    height: 38,
                    width: 38,
                    fit: BoxFit.fitWidth,
                  )),
            )
          ],
          // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
          title: Text(
            "Tin tức",
            style: AppTheme.textStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeatureNews(news: _featureNews),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tin tức mới",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
             Expanded(
               child: ListView.builder(
                 physics: physics,
                 itemCount: _normalNews.length,
                 itemBuilder: (context, index) => NewsItem(news: _normalNews[index]),),
             )

            ],
          ),
        ),
      ),
    );
  }
}

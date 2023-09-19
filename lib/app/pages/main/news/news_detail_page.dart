import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/news/news_detail_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/news_detail/news_detail.dart';
import 'package:zen8app/utils/extensions/date_time_ext.dart';
import 'package:zen8app/utils/helpers/default_instance.dart';
import 'package:zen8app/utils/helpers/extendable.dart';
import 'package:zen8app/utils/helpers/mvvm_binding.dart';
import 'package:zen8app/widgets/sources/custom_appbar.dart';
import 'package:zen8app/widgets/sources/html_text.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import 'package:zen8app/widgets/sources/news_item.dart';

import '../../../../models/sources/news/news.dart';

@RoutePage()
class NewsDetailPage extends StatefulWidget {
  final int id;
  const NewsDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage>
    with MVVMBinding<NewsDetailVm, NewsDetailPage> {
  String title = '';
  NewsDetail news = DefaultEmptyInstant.newsDetail;
  var _relatedNew = <News>[];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.offset > 120) {
      setState(() {
        title = news.title;
      });
    } else {
      setState(() {
        title = '';
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {
      setState(() {
        news = value;
      });
    }).addTo(subscription);


    vm.output.relatedNews.listen((value) {
      setState(() {
       _relatedNew = value.items;
      });
    }).addTo(subscription);
    reload();
  }

  void reload(){
    vm.input.reload.add(widget.id);
    vm.input.relate.add(widget.id);
  }

  @override
  NewsDetailVm onCreateVM() {
    return NewsDetailVm();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: vm.activityTracker.isRunningAny(),
      error: vm.errorTracker.asAppException(),
      emptyStateBuilder: (context) {},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),overflow: TextOverflow.clip),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                _buildTitle(),
                SizedBox(
                  height: 10,
                ),
               _buildCreatedDate(),
                SizedBox(height: 10,),
                _buildCategory(),
                _content(),
                SizedBox(height: 40,),
                Text("Bài viêt liên quan",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                SizedBox(height: 30,),
                ..._relatedNew.map((e) => NewsItem(news: e))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      news.title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }

  Widget _buildCreatedDate(){
    return  Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: 16,
          color: AppTheme.deepGreyColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          news.createdAt.ex.asString(DatePattern.yyMMyyyyHHmm),
          style:
          TextStyle(color: AppTheme.deepGreyColor, fontSize: 16),
        )
      ],
    );
  }

  Widget _buildCategory() {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      children: news.categoriesObj.map((e) => _categoryItem(e.label)).toList()
      ,
    );
  }

  Widget _categoryItem(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      margin: EdgeInsets.only(right: 10,bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xFFF5F5F5)),
      child: Text(label ,style: TextStyle(color: AppTheme.deepGreyColor)),
    );
  }

  Widget _content(){
    return HtmlText(news.content);
  }
}

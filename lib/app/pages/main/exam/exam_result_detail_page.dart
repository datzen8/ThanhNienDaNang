import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/app/pages/main/exam/question_card.dart';
import 'package:zen8app/app/pages/main/exam/result_card.dart';
import 'package:zen8app/utils/extensions/list_ext.dart';
import 'package:zen8app/utils/helpers/extendable.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/exam/exam.dart';

@RoutePage()
class DetailResultPage extends StatefulWidget {
  final Exam exam;
  const DetailResultPage({Key? key, required this.exam}) : super(key: key);

  @override
  State<DetailResultPage> createState() => _DetailResultPageState();
}

class _DetailResultPageState extends State<DetailResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.exam.questions.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Image.asset(
                "images/black-close.png",
                width: 12,
                height: 12,
              )),
          centerTitle: true,
          title: Text("Xem kết quả bài thi",  style: AppTheme.textStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),
          bottom: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: widget.exam.questions.asMap().entries.map(
                (e) {
                  var index = e.key;
                  var question = e.value;
                  return Tab(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Center(
                      child: Text(
                          "${(index + 1).toString()}/${widget.exam.questions.length}",
                          style: TextStyle(
                              color: question.correctAnswers.ex
                                      .isEqual(question.submittedAnswers)
                                  ? Colors.greenAccent
                                  : Colors.red)),
                    ),
                  ));
                },
              ).toList()),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: widget.exam.questions
                      .map(
                        (e) => ResultCard(
                          question: e,
                        ),
                      )
                      .toList()),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  _tabController.index == 0
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {
                            --_tabController.index;
                          },
                          child: Text(
                            "Câu trước",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              backgroundColor: Color(0xFFF5F5F5)),
                        ),
                  Expanded(child: Container()),
                  _tabController.index == _tabController.length - 1
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {
                            ++_tabController.index;
                          },
                          child: Text("Câu tiếp theo"))
                ],
              ),
            )
          ],
        ));
  }
}

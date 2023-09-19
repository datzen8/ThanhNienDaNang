import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/exam/exam_vm.dart';
import 'package:zen8app/app/pages/main/exam/question_card.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/exam/exam.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import 'package:zen8app/widgets/sources/text_count_down.dart';
import '../../../../widgets/sources/custom_dialog.dart';

@RoutePage()
class ExamPage extends StatefulWidget {
  final contestId;
  const ExamPage({Key? key, this.contestId}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage>
    with MVVMBinding<ExamVM, ExamPage>, TickerProviderStateMixin {
  late TabController _tabController;
  Exam? _exam;
  List<bool> answeredList = [];
  int _activeTabIndex = 0;
  List<Map> dataAnswers = [];

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.respnonse.listen((value) {
      setState(() {
        _exam = value;
        _tabController = TabController(
            vsync: this,
            length: _exam!.questions.length,
            animationDuration: Duration(milliseconds: 500));

        answeredList = _exam!.questions.map((e) => false).toList();
      });
    }).addTo(subscription);

    vm.output.submitResponse.listen((value) {
      context.router.replace(ResultRoute(
          result: value.result, contest: value.contest, exam: value.exam));
    }).addTo(subscription);

    _reload();
  }

  _reload() {
    vm.input.reload.add(widget.contestId);
  }

  @override
  ExamVM onCreateVM() => ExamVM();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: 0, animationDuration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
        error: vm.errorTracker.asAppException(),
        isLoading: vm.activityTracker.isRunningAny(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.2,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: "Thoát khỏi bài thi",
                            description:
                                "Kết quả thi sẽ không được lưu lại. Bạn có chắc muốn thoát khỏi bài thi này không ?",
                            rightAction: DialogAction(
                                title: "Thoát",
                                onTap: () => context.router
                                    .popUntilRouteWithName(
                                        "ContestDetailRoute")),
                            leftAction: DialogAction(
                                title: "Tiếp tục thi",
                                backgroundColor: Colors.white38,
                                onTap: () => context.router.pop()),
                          );
                        });
                  },
                  icon: Image.asset(
                    "images/black-close.png",
                    width: 12,
                    height: 12,
                  )),
              centerTitle: true,
              title: CountDownText(),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                                title: "Xác nhận nộp bài",
                                description:
                                    "Kết quả thi sẽ không được lưu lại. Bạn có chắc muốn thoát khỏi bài thi này không ?",
                                rightAction: DialogAction(
                                    title: "Xác nhận",
                                    onTap: () {
                                      vm.input.submit
                                          .add((dataAnswers, _exam!.id));
                                    }),
                                leftAction: DialogAction(
                                    title: "Hủy",
                                    textColor: Colors.black,
                                    backgroundColor: Color(0xFFF5F5F5),
                                    onTap: () => context.router.pop()),
                              ));
                    },
                    child: Text("Nộp bài"),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(60, 80),
                        backgroundColor: Color(0xFF00B191)))
              ],
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
                  tabs: List.generate(_tabController.length, (index) => index)
                      .map(
                    (e) {
                      return Tab(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        child: Center(
                          child: Text(
                              "${(e + 1).toString()}/${_exam!.questions.length}",
                              style: TextStyle(
                                  color: answeredList[e]
                                      ? Colors.greenAccent
                                      : Colors.black)),
                        ),
                      ));
                    },
                  ).toList()),
            ),
            body: _exam == null
                ? Container()
                : Column(
      children: [
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: List.generate(
                  _tabController.length, (index) => index)
                  .map(
                    (e) => QuestionCard(
                  question: _exam!.questions[e],
                  callback: (value, answer) {
                    setState(() {
                      answeredList[e] = value;
                    });
                    if (value) {
                      dataAnswers.removeWhere(
                            (element) =>
                        element['question'] ==
                            answer['question'],
                      );
                      dataAnswers.add(answer);
                    } else {
                      dataAnswers.remove(answer);
                    }
                  },
                ),
              )
                  .toList()),
        ),
        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    )));
  }
}

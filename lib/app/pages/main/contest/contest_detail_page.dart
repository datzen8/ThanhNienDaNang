import 'package:auto_route/auto_route.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/contest/contest_detail_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/custom_button.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/contest/contest.dart';
import '../../../../widgets/sources/default_network_image.dart';
import '../../../../widgets/sources/tag.dart';

@RoutePage()
class ContestDetailPage extends StatefulWidget {
  final int id;
  const ContestDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ContestDetailPage> createState() => _ContestDetailPageState();
}

class _ContestDetailPageState extends State<ContestDetailPage>
    with MVVMBinding<ContestDetailVm, ContestDetailPage> {
  Contest? _contest;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
        isLoading: vm.activityTracker.isRunningAny(),
        error: vm.errorTracker.asAppException(),
        child: Scaffold(
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
              // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
              title: Text(
                "Chi tiết cuộc thi",
                style: AppTheme.textStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: _contest == null
                  ? Container()
                  : Column(
                      children: [
                        DefaultNetworkImage(
                          imageUrl: _contest!.coverImage,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        _buildContent(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CustomButton(
                                text: "Bắt dầu làm bài thi",
                                onPress: () {
                                  context.router.push(ExamRoute(contestId: widget.id));
                                },
                                width: double.infinity,
                                )),
                        SizedBox(
                          height: 20,
                        ),
                        _contest!.examId == null
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: CustomButton(
                                    text: "Xem kết quả bài thi",
                                    width: double.infinity,
                                    onPress: () {
                                      vm.input.reloadResult.add(_contest!.examId!);
                                    },
                                    btnColor: Color(0xFFEFF6FF),
                                    textColor: AppTheme.primaryColor)),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            )));
  }

  void _reload() {
    vm.input.reload.add(widget.id);
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {
      setState(() {
        _contest = value;
      });
    }).addTo(subscription);

    vm.output.resultResponse.listen((value) {
      context.router.push(ResultRoute(result: value.result, contest: value.contest, exam: value.exam));
    }).addTo(subscription);


    _reload();
  }

  @override
  ContestDetailVm onCreateVM() => ContestDetailVm();


  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Tag(
                  title: _contest!.participantsToString,
                  backgroundColor: Color(0xFF00B191),
                  pathIcon: "images/white-users.png"),
              SizedBox(
                width: 10,
              ),
              Tag(
                  title: _contest!.statusObj.label,
                  backgroundColor: AppTheme.primaryColor)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _contest!.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          _contest!.examId == null ? Container() : Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Image.asset("images/green-checked-circle.png" ,height: 20,),
                SizedBox(width: 10,),
                Text("Bạn đã hoàn thành cuộc thi này", style: TextStyle(color: Color(0xFF00B191)),)
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          _buildContentItem(
              title: "Mô tả cuộc thi",
              child: customExpanedText(_contest!.description),
              pathIcon: 'images/blue-calendar.png'),
          _buildContentItem(
              title: "Số lượng câu hỏi",
              child: customExpanedText(
                  _contest!.numberOfQuestion.toString() + " câu"),
              pathIcon: 'images/blue-calendar.png'),
          _buildContentItem(
              title: "Điểu kiện hoàn thành",
              child: customExpanedText(_contest!.minScore.toString() + " câu"),
              pathIcon: 'images/blue-marker.png'),
          _buildContentItem(
              title: "Thời gian làm bài",
              child: customExpanedText(_contest!.duration.toString() + "phút"),
              pathIcon: 'images/blue-users.png'),
          _buildContentItem(
            title: "Thời gian diễn ra",
            pathIcon: 'images/blue-calendar.png',
            child: customExpanedText(_contest!.occuringTime),
          ),
          _buildContentItem(
            title: "Đơn vị tổ chức",
            pathIcon: 'images/blue-calendar.png',
            child: customExpanedText(_contest!.organizationalUnit),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem(
      {required String title,
      required Widget child,
      required String pathIcon}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.3, color: Colors.grey.shade400))),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                pathIcon,
                width: 18,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget customExpanedText(String text) {
    return ExpandableText(text,
        expandText: "Xem thêm",
        prefixStyle: TextStyle(color: Color(0xFF005CE)),
        linkStyle: TextStyle(color: Color(0xFF005CE7)),
        maxLines: 4,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        collapseText: "Ẩn bớt");
  }
}

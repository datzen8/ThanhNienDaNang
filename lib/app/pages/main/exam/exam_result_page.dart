import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/calendar_text.dart';
import 'package:zen8app/widgets/sources/custom_button.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/contest/contest.dart';
import '../../../../models/sources/exam/exam.dart';
import '../../../../models/sources/result/result.dart';

@RoutePage()
class ResultPage extends StatelessWidget {
  final Result result;
  final Contest contest;
  final Exam exam;

  const ResultPage(
      {Key? key,
      required this.result,
      required this.contest,
      required this.exam})
      : super(key: key);

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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
        title: Text(
          "Kết quả bài thi",
          style: AppTheme.textStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              contest.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 5,
            ),
            CalendarText(
                text:
                    "Hoàn thành bài thi lúc : ${result.submittedAt.ex.asString(DatePattern.HHmmssddMMyy)}",
                size: 14),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 14.0,
                mainAxisSpacing: 14.0,
                children: [
                  resultCard(
                      title: "Kết quả",
                      result: result.numberOfCorrectAnswers >=
                              contest.numberOfQuestion
                          ? "Đạt"
                          : "Không Đạt",
                      textColor: result.numberOfCorrectAnswers >=
                              contest.numberOfQuestion
                          ? Color(0xFF00B191)
                          : Colors.red),
                  resultCard(
                      title: "Thời gian làm bài",
                      result: (exam.submittedAt?.difference(exam.startedAt))
                          .toString()
                          .substring(0, 7)),
                  resultCard(
                      title: "Số câu hỏi",
                      result: result.numberOfQuestions.toString()),
                  resultCard(
                      title: "Số câu trả lời đúng",
                      result: result.numberOfCorrectAnswers.toString()),
                ],
              ),
            ),
            CustomButton(
              text: "Xem chi tiết",
              onPress: () {
                context.router.push(DetailResultRoute(exam: exam));
              },
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  Widget resultCard(
      {required String title,
      required String result,
      Color textColor = Colors.black}) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Color(0xFFE3E3E3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 14),
          ),
          Text(
            result,
            style: TextStyle(
                color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

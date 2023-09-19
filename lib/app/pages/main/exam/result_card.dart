import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/models/sources/question/question.dart';

import '../../../../models/sources/answer/answer.dart';

class ResultCard extends StatelessWidget {
  final Question question;
  const ResultCard({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.content,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            question.type == 2
                ? Text('(*)Câu hỏi có nhiều đáp án đúng',
                    style: TextStyle(color: Color(0xFF8A8A8A)))
                : Container(),
            ...question.answers.map((e) {
              return _buildChecklistTile(answer: e);
            })
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistTile({required Answer answer}) {
    bool isSubmittedAnswer = question.submittedAnswers.contains(answer.id);

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color:isSubmittedAnswer ?Colors.white : Color(0xFFF5F5F5) ,
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: isSubmittedAnswer ? Border.all(color: Colors.grey, width: 0.5) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              _handleImageUrl(answerId: answer.id),
              height: 28,
              width: 28,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                answer.content,
                style: TextStyle(
                    fontSize: 15, height: 4 / 3, overflow: TextOverflow.clip),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _handleImageUrl({required int answerId}) {
    bool isCorrectAnswer = question.correctAnswers.contains(answerId);
    bool isSubmittedAnswer = question.submittedAnswers.contains(answerId);

    if (isSubmittedAnswer && !isCorrectAnswer) {
      return 'images/cross-circle-red.png';
    } else if (isCorrectAnswer) {
      return 'images/green-checked-circle.png';
    }

    return 'images/uncheck_answer.png';
  }
}

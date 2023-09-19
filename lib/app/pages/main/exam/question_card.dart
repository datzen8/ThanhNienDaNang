import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/models/sources/question/question.dart';

import '../../../../models/sources/answer/answer.dart';

enum QuestionType {
  single,
  mutiple;

  String get checkedImageUrl {
    return switch (this) {
      QuestionType.single => 'images/blue_checked.png',
      QuestionType.mutiple => 'images/blue-circle-checked.png',
    };
  }
}

class QuestionCard extends StatefulWidget {
  final Question question;
  final Function(bool value, Map data) callback;
  final bool isViewMode;
  const QuestionCard({Key? key, required this.question, required this.callback, this.isViewMode = false})
      : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with AutomaticKeepAliveClientMixin<QuestionCard> {
  List<bool> _checkboxStates = [];
  late Map answerData;

  int numberOfAnswers = 0;
  late QuestionType questionType;

  @override
  void initState() {
    numberOfAnswers = widget.question.answers.length;
    setState(() {
      _checkboxStates =
          List.generate(numberOfAnswers, (index) => false).toList();

      questionType = QuestionType.values[widget.question.type - 1];

      answerData = {"question": widget.question.id, "answers": <int>[] as List<int>};
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.content,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            widget.question.type == 2
                ? Text('(*)Câu hỏi có nhiều đáp án đúng',
                    style: TextStyle(color: Color(0xFF8A8A8A)))
                : Container(),
            ..._checkboxStates.asMap().entries.map((entry) {
              int idx = entry.key;
              return _buildChecklistTile(
                  answer: widget.question.answers[idx], index: idx);
            })
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistTile({required Answer answer, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!_checkboxStates[index] && questionType == QuestionType.single) {
            // set all answer value to be false
            _checkboxStates =
                List.generate(numberOfAnswers, (index) => false).toList();

            _checkboxStates[index] = true;
            answerData['answers'] = [answer.id];
          } else {
            _checkboxStates[index] = !_checkboxStates[index];
            _handleSingleAnswerData(
                questionType, answer.id, _checkboxStates[index]);
          }
        });
        widget.callback(_checkboxStates.contains(true), answerData);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: _checkboxStates[index] ? Colors.white : Color(0xFFF5F5F5),
            borderRadius: BorderRadius.all(Radius.circular(7)),
            border: _checkboxStates[index]
                ? Border.all(color: Colors.grey, width: 0.5)
                : null),
        duration: Duration(milliseconds: 300),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              _checkboxStates[index]
                  ? questionType.checkedImageUrl
                  : 'images/uncheck_answer.png',
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

  void _handleSingleAnswerData(
      QuestionType questionType, int answerId, bool isAdd) {
    if (questionType == QuestionType.mutiple && isAdd) {
      answerData['answers'].add(answerId);
    }
    else if (questionType == QuestionType.mutiple && !isAdd) {
      answerData['answers'].remove(answerId);
    } else {
      answerData['answers'] = [];
    }
  }

  @override
  bool get wantKeepAlive => true;
}

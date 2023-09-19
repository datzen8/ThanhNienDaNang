import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/sources/app_theme.dart';

class CalendarText extends StatelessWidget {
  final double size;
  final String text;
  const CalendarText({Key? key, required this.text, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: size,
          color: AppTheme.deepGreyColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppTheme.deepGreyColor,
            fontSize: size,
          ),
        )
      ],
    );
  }
}

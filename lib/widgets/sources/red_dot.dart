import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedDot extends StatelessWidget {
  const RedDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle, color: Colors.red
      ),
    );
  }
}

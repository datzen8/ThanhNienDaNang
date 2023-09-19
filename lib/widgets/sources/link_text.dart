import 'package:flutter/cupertino.dart';

import '../../core/sources/app_theme.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function callback;
  const LinkText ({Key? key, required this.text, required this.callback}) : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.callback();
      },
      child: Text(
        widget.text,
        style: TextStyle(color: AppTheme.primaryColor,fontSize: 14,fontWeight: FontWeight.w500 ),
      ),
    );
  }
}

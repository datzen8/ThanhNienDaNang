import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  String title;
  Color backgroundColor;
  String? pathIcon;



  Tag({required this.title, required this.backgroundColor, this.pathIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
       decoration: BoxDecoration(
         color: backgroundColor,
         borderRadius: BorderRadius.circular(5.0),
       ),
      child: Row(
        children: [
          pathIcon != null ? Image.asset(pathIcon! ,height: 12,width: 12,fit: BoxFit.fitHeight,): Container(),
          pathIcon != null ?SizedBox(width:5) :Container(),
          Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 12),),

        ],
      ),
    );
  }
}

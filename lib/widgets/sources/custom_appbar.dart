import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/sources/app_theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    BuildContext? context,
    Key? key,
    String? title,
    double elevation = 0.3,
    Color backgroundColor = Colors.white,
    VoidCallback? leadingAction,
    List<Widget>? actions,
    Widget? leading,
  }) : super(
    key: key,
    titleSpacing: context == null && leading == null ? 16 : 4,
    elevation: elevation,
    leadingWidth: 32,
    toolbarHeight: 50,
    backgroundColor: backgroundColor,
    title: _titleWidget(title),
    leading: leading ??
        (context == null
            ? null
            : _leadingWidget(context, back: leadingAction)),
    actions: [
      if (actions != null) ...actions,
      const SizedBox(
        width: 12,
      )
    ],
  );

  static Widget? _leadingWidget(BuildContext context, {VoidCallback? back}) =>
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: InkWell(
          onTap: back ?? context.popRoute,
          // child: Image.asset(
          //   "images/ic_back.png",
          //   width: 28,
          //   height: 28,
          // ),
        ),
      );

  static Widget? _titleWidget(String? title) {
    if (title != null) {
      return Text(
        title,
        style: AppTheme.textStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.33,
        ),
      );
    }
    return null;
  }
}

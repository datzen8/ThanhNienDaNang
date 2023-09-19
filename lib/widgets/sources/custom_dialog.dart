import 'package:flutter/material.dart';

import 'package:zen8app/core/core.dart';

class DialogAction {
  final VoidCallback? onTap;
  final String title;
  final Color textColor;
  final Color? backgroundColor;

  DialogAction({
    this.onTap,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
  });
}

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final DialogAction? leftAction;
  final DialogAction? rightAction;
  const CustomDialog({
    Key? key,
    this.title,
    this.description,
    this.leftAction,
    this.rightAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16.0), // Set your desired radius here
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!,
                style: AppTheme.textStyle(
                  color: const Color(0xFF3A3A3A),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 26 / 18,
                  letterSpacing: -0.20,
                ),
              ),
            const SizedBox(height: 4),
            if (description != null)
              Text(
                description!,
                style: AppTheme.textStyle(
                  color: const Color(0xFF6A6A6A),
                  fontSize: 14,
                  height: 20 / 14,
                ),
              ),
            const SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                    child: leftAction == null
                        ? SizedBox()
                        : _actionButton(context, leftAction!)),
                SizedBox(width: 16),
                Expanded(
                  child: rightAction == null
                      ? SizedBox()
                      : _actionButton(context, rightAction!),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _actionButton(BuildContext context, DialogAction action) {
    return ElevatedButton(
      onPressed: action.onTap,
      style:ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: action.backgroundColor ?? Colors.blueAccent
      ),
      child: Text(
        action.title,
        style: TextStyle(
          fontSize: 15,
          color: action.textColor,
        ),
      ),
    );
  }
}

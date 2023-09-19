import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/app/pages/main/profile/bottom_sheet_custom.dart';
import 'package:zen8app/models/sources/option/option.dart';
import 'package:zen8app/utils/helpers/ui_utils.dart';

import '../../../../core/sources/app_theme.dart';

class DropdownTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final List<Option> list;
  final TextEditingController controller;
  final Function(Option value) callback;
  const DropdownTextField(
      {Key? key,
      required this.label,
      required this.callback,
      required this.hintText,
      required this.list,
      required this.controller})
      : super(key: key);

  @override
  State<DropdownTextField> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFFA3A3A3)),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          onTap: () {
            showModalBottomScrollableSheet<Option>(
              minChildSize: 0.3,
              initialChildSize: 0.5,
              maxChildSize: 0.7,
              context: context,
              bodyBuilder: (context, scrollController) {
                return DropDownWidget(
                  title: widget.label,
                  listItem: widget.list,
                );
              },
            ).then((value) {
              if (value != null) {
                widget.callback(value);
              }
            });
          },
          readOnly: true,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              helperText: "",
              hintStyle: TextStyle(color: Color(0xFFA3A3A3)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
              focusedErrorBorder: InputBorder.none),
        )
      ],
    );
  }
}

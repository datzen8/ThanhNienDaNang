import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../widgets/sources/custom_textfield.dart';

class DateSelectionForm extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  Function(DateTime? date)? callback;

  DateSelectionForm(
      {required this.label,
      required this.hintText,
      required this.controller,
      this.callback});

  @override
  _DateSelectionFormState createState() => _DateSelectionFormState();
}

class _DateSelectionFormState extends State<DateSelectionForm> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = DateFormat(DatePattern.yyMMyyyyHHmm)
            .format(_selectedDate!); // Update text field
      });
      if (widget.callback != null) {
        widget.callback!(_selectedDate);
      }
    }
  }

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
            FocusScope.of(context).requestFocus(FocusNode()); // Close keyboard
            _selectDate(context);
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
              ),
              suffixIcon: Icon(Icons.calendar_today_rounded),
              focusedErrorBorder: InputBorder.none),
        )
      ],
    );
  }
}

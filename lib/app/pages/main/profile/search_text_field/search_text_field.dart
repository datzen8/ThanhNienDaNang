import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen8app/app/pages/main/profile/search_text_field/search_container.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/organization/organization.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import '../../../../../core/sources/app_theme.dart';
import '../../../../../utils/helpers/ui_utils.dart';

class SearchTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  SearchTextField(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

  Organization?  _organization;

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
            showSearchModal(context);
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
              focusedErrorBorder: InputBorder.none),
        )
      ],
    );
  }

  void showSearchModal(BuildContext context) {
    showModalBottomScrollableSheet(
        snap: true,
        minChildSize: 0.3,
        initialChildSize: 0.8,
        maxChildSize: 0.9,
        context: context,
        bodyBuilder: (context, scrollController) {
          return SearchContainer();
        }).then((value){
          setState(() {
            _organization = value as Organization;
            widget.controller.text = _organization!.title;
          });
    });

  }



}

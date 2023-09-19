import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/option/option.dart';

class DropDownWidget extends StatefulWidget {
  final ScrollController? scrollController;
  final String title;
  final Option? currentItem;
  final List<Option> listItem;
  const DropDownWidget({
    Key? key,
    this.scrollController,
    required this.title,
    this.currentItem,
    required this.listItem,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState<T> extends State<DropDownWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Text(
              widget.title,
              style: AppTheme.textStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          SizedBox(height: 20,),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 24),
              controller: widget.scrollController,
              itemCount: widget.listItem.length,
              itemBuilder: (context, index) {
                var item = widget.listItem[index];
                var isSelected = item == widget.currentItem;
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      context.popRoute(item);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.label,
                      style: AppTheme.textStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.31,
                        color: isSelected ? AppTheme.primaryColor : Colors.black,
                      ),
                    ),
                    trailing: isSelected
                        ? Image.asset(
                      'images/checked-blue-circle.png',
                      width: 24,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      height: 24,
                      width: 24,
                    ),
                  ),
                );
              },
            ),
          ),
          _changePasswordButton()
        ],
      ),
    );
  }
  Container _changePasswordButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 56,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () {

        },
        child: Text(
          "Lưu lại",
          style: AppTheme.textStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

}
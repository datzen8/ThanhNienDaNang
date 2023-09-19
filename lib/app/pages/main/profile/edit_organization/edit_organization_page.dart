import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/app/pages/main/profile/edit_organization/edit_organization_vm.dart';
import 'package:zen8app/app/pages/main/profile/profile_date_picker_text_field.dart';
import 'package:zen8app/app/pages/main/profile/search_text_field/search_text_field.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../../core/sources/app_theme.dart';
import '../../../../../models/sources/option/option.dart';
import '../../../../../models/sources/profile/profile.dart';
import '../../../../../models/sources/profile_options/profile_options.dart';
import '../../../../../widgets/sources/custom_button.dart';
import '../dropdown_text_field.dart';

@RoutePage()
class EditOrganizationPage extends StatefulWidget {
  final Profile profile;
  final ProfileOptions options;
  const EditOrganizationPage(
      {Key? key, required this.profile, required this.options})
      : super(key: key);

  @override
  State<EditOrganizationPage> createState() => _EditOrganizationPageState();
}

class _EditOrganizationPageState extends State<EditOrganizationPage> with MVVMBinding<EditOrganizationVM,EditOrganizationPage> {



  late Option? position = widget.profile.positionObj;
  late DateTime? dateOfJoin = widget.profile.joinedDate;
  late Option? orginization = widget.profile.organizationObj;

  TextEditingController positionController = TextEditingController();
  TextEditingController dateOfJoinController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  @override
  void initState() {
    positionController.text = position?.label ?? "";
    dateOfJoinController.text = dateOfJoin.ex.asString(DatePattern.mmmddHHmm);
    organizationController.text = orginization?.label ?? "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.2,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Chỉnh sửa  thông tin Đoàn",
            style: AppTheme.textStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownTextField(
              hintText: "Chọn chức vụ đoàn viên",
              label: "Chức vụ đoàn viên",
              list: widget.options.position,
              controller: positionController,
              callback: (value){
                setState(() {
                  position = value;
                  positionController.text = value.label;
                  widget.profile.positionObj = value;
                });
              },
            ),
            DateSelectionForm(
              label: "Ngày tham gia đoàn",
              hintText: "Chọn ngày tham gia đoàn",
              controller: dateOfJoinController,
            ),
            SearchTextField(
                label: "Nơi sinh hoạt Đoàn",
                hintText: "Nhập nơi sinh hoạt Đoàn",
                controller: organizationController),
            CustomButton(
              text: "Lưu lại",
              onPress: () {
                // vm.input.update.add({
                //
                // });
              },
              width: double.infinity,
              height: 56,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) async {
      context.router.pop();
    });
  }

  @override
  EditOrganizationVM onCreateVM() {
    return EditOrganizationVM();
  }

}

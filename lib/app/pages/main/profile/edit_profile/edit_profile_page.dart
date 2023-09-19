import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/profile/dropdown_text_field.dart';
import 'package:zen8app/app/pages/main/profile/profile_date_picker_text_field.dart';
import 'package:zen8app/app/pages/main/profile/profile_text_field.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/profile_options/profile_options.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';

import '../../../../../core/sources/app_theme.dart';
import '../../../../../models/sources/option/option.dart';
import '../../../../../models/sources/profile/profile.dart';
import '../../../../../widgets/sources/custom_textfield.dart';
import 'edit_profile_vm.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  Profile profile;
  ProfileOptions options;
  EditProfilePage({Key? key, required this.profile, required this.options})
      : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with MVVMBinding<EditProfileVM, EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late Profile copyProfile;

  TextEditingController nameController = TextEditingController();
  TextEditingController placeOfOriginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController identityIdController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController providedDay = TextEditingController();
  TextEditingController issuedDateController = TextEditingController();
  TextEditingController idIssuedPlaceController = TextEditingController();
  TextEditingController placeOfOrigin = TextEditingController();
  TextEditingController placeOfResident = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController ethnicController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  late Option? genderObj = widget.profile.genderObj;
  late Option? occupationObj = widget.profile.occupationObj;
  late Option? religionObj = widget.profile.religionObj;
  late Option? ethinicObj = widget.profile.ethnicObj;

  @override
  void initState() {
    setState(() {
      nameController.text = widget.profile.fullName;
      phoneNumberController.text = widget.profile.mobile;
      emailController.text = widget.profile.email;
      identityIdController.text = widget.profile.idNumber;
      placeOfResident.text = widget.profile.placeOfResidence;

      idIssuedPlaceController.text = widget.profile.idIssuedPlace;
      dateOfBirthController.text =
          widget.profile.dob.ex.asString(DatePattern.yyMMyyyyHHmm);
      placeOfOriginController.text = widget.profile.placeOfOrigin;
      genderController.text = widget.profile.genderObj.ex.getLabel();
      ethnicController.text = widget.profile.ethnicObj.ex.getLabel();
      religionController.text = widget.profile.religionObj.ex.getLabel();
      occupationController.text = widget.profile.occupationObj.ex.getLabel();
      issuedDateController.text =
          widget.profile.idIssuedDate.ex.asString(DatePattern.yyMMyyyyHHmm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
        error: vm.errorTracker.asAppException(),
        isLoading: vm.activityTracker.isRunningAny(),
        child: Scaffold(
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
                "Thông tin đoàn viên",
                style: AppTheme.textStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              centerTitle: true),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: ProfileTextField(
                    controller: nameController,
                    hintText: "Họ và tên",
                    lable: "Họ và tên",
                    callback: (value) {
                      widget.profile.fullName = value ?? "";
                    },
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: phoneNumberController,
                    validator: (String? value) {
                      bool isValidEmail = value?.ex.isValidEmail() ?? false;
                      bool isValidPhone =
                          value?.ex.isValidPhoneNumber() ?? false;
                      if (isValidPhone || isValidEmail) {
                        return null;
                      }
                      return "Số điện thoại hoặc email không hợp lệ";
                    },
                    hintText: "Nhập số điện thoại",
                    lable: "Số điện thoại",
                    textInputType: TextInputType.number,
                    callback: (value) {
                      widget.profile.mobile = value ?? "";
                    },
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: emailController,
                    hintText: "Email",
                    lable: "Email",
                    enable: false,
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: identityIdController,
                    hintText: "Nhập số CCCD",
                    lable: "Số CCCD",
                    textInputType: TextInputType.number,
                    callback: (value) {
                      widget.profile.idNumber = value ?? "";
                    },
                  )),
                  Flexible(
                      child: DateSelectionForm(
                    label: "Ngày cấp ",
                    hintText: "Ngày cấp",
                    controller: issuedDateController,
                    callback: (value) {
                      widget.profile.idIssuedDate = value;
                    },
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: idIssuedPlaceController,
                    hintText: "Nhập nơi cấp",
                    lable: "Nơi cấp",
                    callback: (value) {
                      widget.profile.idIssuedPlace = value ?? "";
                    },
                  )),
                  Flexible(
                      child: DateSelectionForm(
                    label: "Ngày sinh ",
                    hintText: "Ngày sinh",
                    controller: dateOfBirthController,
                    callback: (value) {
                      widget.profile.dob = value;
                    },
                  )),
                  Flexible(
                      child: DropdownTextField(
                    hintText: "Chọn giới tính",
                    label: "Giới tính",
                    list: widget.options.gender,
                    controller: genderController,
                    callback: (value) {
                      _modifyState(genderObj, genderController, value,
                          (option) {
                        widget.profile.gender = option.value;
                        widget.profile.genderObj = option;
                      });
                    },
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: placeOfOriginController,
                    hintText: "Nhập quê quán",
                    lable: "Quê quán",
                    callback: (value) {
                      widget.profile.placeOfOrigin = value ?? "";
                    },
                  )),
                  Flexible(
                      child: ProfileTextField(
                    controller: placeOfResident,
                    hintText: "Nhập địa chỉ thường trú",
                    lable: "Địa chỉ thường trú",
                    callback: (value) {
                      widget.profile.placeOfResidence = value ?? "";
                    },
                  )),
                  Flexible(
                      child: DropdownTextField(
                    hintText: "Chọn dân tộc",
                    label: "Dân tộc",
                    list: widget.options.ethnic,
                    controller: ethnicController,
                    callback: (value) {
                      _modifyState(ethinicObj, ethnicController, value,
                          (option) {
                        widget.profile.ethnic = option.value;
                        widget.profile.ethnicObj = option;
                      });
                    },
                  )),
                  Flexible(
                      child: DropdownTextField(
                    hintText: "Chọn tôn giáo",
                    label: "Tôn giáo",
                    list: widget.options.religion,
                    controller: religionController,
                    callback: (value) {
                      _modifyState(religionObj, religionController, value,
                          (option) {
                        widget.profile.religion = option.value;
                        widget.profile.religionObj = option;
                      });
                    },
                  )),
                  Flexible(
                      child: DropdownTextField(
                          hintText: "Chọn nghề nghiệp",
                          label: "Nghề nghiệp",
                          list: widget.options.occupation,
                          controller: occupationController,
                          callback: (value) {
                            _modifyState(
                                occupationObj, occupationController, value,
                                (option) {
                              widget.profile.occupation = option.value;
                              widget.profile.occupationObj = option;
                            });
                          })),
                  SizedBox(
                    height: 20,
                  ),
                  _changePasswordButton()
                ],
              ),
            ),
          ),
        ));
  }

  void _modifyState(Option? option, TextEditingController textEditingController,
      Option targetOption, Function(Option target) callback) {
    setState(() {
      option = targetOption;
      textEditingController.text = targetOption.label;
    });
    callback(targetOption);
  }

  Widget _changePasswordButton() {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            vm.input.update.add(widget.profile.toJson());
          }
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

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {

    },onDone: (){
      print("------------------> done");
    },onError: (){
      print("--------------> erro");
    }

    ).addTo(subscription);
  }

  @override
  EditProfileVM onCreateVM() {
    return EditProfileVM();
  }
}

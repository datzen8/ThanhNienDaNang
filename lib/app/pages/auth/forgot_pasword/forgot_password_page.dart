import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/app/pages/auth/forgot_pasword/forgot_password_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/extensions/string_ext.dart';
import 'package:zen8app/utils/helpers/extendable.dart';
import 'package:zen8app/widgets/sources/custom_dialog.dart';

import '../../../../utils/helpers/mvvm_binding.dart';
import '../../../../widgets/sources/custom_textfield.dart';
import '../../../../widgets/sources/loading_widget.dart';
@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with MVVMBinding<ForgotPasswordVM, ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "gmail1@gmail.com");



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
              onPressed: () {context.router.pop();},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
            title: Text(
              "Quên mật khẩu",
              style: AppTheme.textStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Nhập địa chỉ email bạn đã đăng ký",
                    style: AppTheme.subTitleTextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Địa chỉ email',
                    controller: _emailController,
                    validator: ( String? value) {
                      print(value);
                      bool isValidEmail = value?.ex.isValidEmail() ?? false;
                      bool isValidPhone = value?.ex.isValidPhoneNumber() ?? false;
                      if (isValidPhone || isValidEmail) {
                        return null;
                      }
                      return "Địa chỉ email không đúng định dạng";
                    },
                  ),
                  SizedBox(height: 8,),
                  _submitButton()
                ],
              ),
            ),
          ),
        ));
  }

  Container _submitButton() {
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
            vm.input.forgot.add(_emailController.text);
          }
        },
        child: Text(
          "Tiếp tục",
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
    vm.output.response.listen((response) async {
            showDialog(context: context, builder: (context) {
              return CustomDialog(
               title: "Đã gửi mật khẩu mới",description: response,
                rightAction: DialogAction(
                  title: "Đã hiểu",
                  onTap: () => Navigator.pop(context),
                ),
              );
            });
    }).addTo(subscription);
  }

  @override
  ForgotPasswordVM onCreateVM() {
    return ForgotPasswordVM();
  }
}

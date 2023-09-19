import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/auth/signup/signup_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/custom_textfield.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import 'package:zen8app/widgets/sources/secured_field.dart';

import '../../../../router/router.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with MVVMBinding<SignupVM, SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: "Dat Do");
  final _emailController = TextEditingController(text:  "gmail@gmail.com");
  final _passwordController = TextEditingController(text: "123456");
  final _phoneNumberContronller  = TextEditingController(text: "0918810522");
  final _confirmPasswordContronller  = TextEditingController(text: "123456");

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
              "Đăng kí tài khoản",
              style: AppTheme.textStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
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
                    "Nhập thông tin để đăng ký tài khoản",
                    style: AppTheme.subTitleTextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Họ và tên',
                    controller: _usernameController,
                  ),
                  SizedBox(height: 8,),
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
                  CustomTextField(
                    controller: _phoneNumberContronller,
                    hintText: 'Số điện thoại',
                    textInputType: TextInputType.number,
                    validator: ( String? value) {
                      print(value);
                      bool isValidPhone = value?.ex.isValidPhoneNumber() ?? false;
                      if (isValidPhone) {
                        return null;
                      }
                      return "Số điện thoại không hợp lệ";
                    },
                  ),
                  SecuredField(
                    controller: _passwordController,
                    hintText: 'Mật khẩu',
                    validator: (value) {
                      int length = value?.length ?? 0;
                      if (length < 6) {
                        return "Mật khẩu phải có ít nhất 6 ký tự";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8,),
                  SecuredField(
                    controller: _confirmPasswordContronller,
                    hintText: 'Nhập lại mật khẩu',
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Mật khẩu không khớp";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24,),
                  _registerButton()
                ],
              ),
            ),
          ),
        ));
  }

  Container _registerButton() {
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
            vm.input.signup.add({
              "email": _emailController.text,
              "password": _passwordController.text,
              "full_name": _usernameController.text,
              "mobile":_phoneNumberContronller.text,
            });
          }
        },
        child: Text(
          "Đăng ký",
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
      await Session.startAuthenticatedSession(response);
      context.router.replaceAll([HomeRoute()], updateExistingRoutes: false);
    }).addTo(subscription);

  }

  @override
  SignupVM onCreateVM() {
    return SignupVM();
  }
}

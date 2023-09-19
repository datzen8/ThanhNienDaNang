import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/personal/change_password_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/utils.dart';
import '../../../../core/sources/app_theme.dart';
import '../../../../widgets/sources/custom_textfield.dart';
import '../../../../widgets/sources/loading_widget.dart';
import '../../../../widgets/sources/secured_field.dart';
@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>  with MVVMBinding<ChangePasswordVM,ChangePasswordPage>{
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _newPassWordController = TextEditingController();
  final _confirmPasswordContronller  = TextEditingController();

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
              "Đổi mật khẩu",
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
                  SizedBox(
                    height: 20,
                  ),
                  SecuredField(
                    controller: _passwordController,
                    hintText: 'Mật khẩu cũ',
                    validator: (value) {
                      int length = value?.length ?? 0;
                      if (length < 6) {
                        return "Mật khẩu phải có ít nhất 6 ký tự";
                      }
                      return null;
                    },
                  ),
                  SecuredField(
                    controller: _newPassWordController,
                    hintText: 'Mật khẩu mới',
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
                    hintText: 'Nhập lại mật mới',
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Mật khẩu không khớp";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24,),
                  _changePasswordButton()
                ],
              ),
            ),
          ),
        ));
  }

  Container _changePasswordButton() {
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
          //   vm.input.signup.add({
          //     "email": _emailController.text,
          //     "password": _passwordController.text,
          //     "full_name": _usernameController.text,
          //     "mobile":_usernameController.text,
          //   });
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
  }

  @override
  ChangePasswordVM onCreateVM() {
    return ChangePasswordVM();
  }
}

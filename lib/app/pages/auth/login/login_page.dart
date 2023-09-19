import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/app/pages/auth/login/login_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/custom_textfield.dart';
import 'package:zen8app/widgets/sources/slogan_text.dart';
import 'package:zen8app/widgets/widgets.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with MVVMBinding<LoginVM, LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: "uyenlinh01@gmail.com");
  final _passwordController = TextEditingController(text: "123456");

  @override
  LoginVM onCreateVM() => LoginVM();

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((response) async {
      await Session.startAuthenticatedSession(response);
      context.router.replaceAll([HomeRoute()], updateExistingRoutes: false);
    }).addTo(subscription);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.errorTracker.listen((value) {
      print(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      error: vm.errorTracker.asAppException(),
      isLoading: vm.activityTracker.isRunningAny(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Chưa có tài khoản ?",
                            style: AppTheme.subTitleTextStyle(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          LinkText(
                              text: "Đăng kí ngay",
                              callback: () {
                                context.router.push(SignUpRoute());
                              })
                        ],
                      ),
                      const SizedBox(height: 16),
                      _usernameField(),
                      const SizedBox(height: 8),
                      _passwordField(),
                      const SizedBox(height: 8),
                      _forgotPasswordText(),
                      const SizedBox(height: 12),
                      _loginButton(),
                      const SizedBox(
                        height: 40,
                      ),
                      SloganText(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _loginButton() {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            vm.input.login
                .add((_usernameController.text, _passwordController.text));
          }
        },
        child: Text(
          "Đăng nhập",
          style: AppTheme.textStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return SecuredField(
      controller: _passwordController,
      hintText: "Mật khẩu",
      validator: (value) {
        int length = value?.length ?? 0;
        if (length < 6) {
          return "Mật khẩu phải có ít nhất 6 ký tự";
        }
        return null;
      },
    );
  }

  Widget _usernameField() {
    return CustomTextField(
      hintText: "Địa chỉ email",
      validator: (String? value) {
        bool isValidEmail = value?.ex.isValidEmail() ?? false;
        bool isValidPhone = value?.ex.isValidPhoneNumber() ?? false;
        if (isValidPhone || isValidEmail) {
          return null;
        }
        return "Số điện thoại hoặc email không hợp lệ";
      },
      controller: _usernameController,
    );
  }

  Widget _forgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LinkText(
            text: "Quên mật khẩu",
            callback: () {
              context.router.push(ForgotPasswordRoute());
            })
      ],
    );
  }


  Widget _buildHeader() {
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/home-cover.png"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.0, 1.0),
                end: Alignment(0.0, -1.0),
                colors: <Color>[
                  Colors.white,
                  AppTheme.primaryColor.withOpacity(0.2)
                ]
                // ),
                ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/logo-app.png',
                  width: 47.25,
                  height: 57.107,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/close.svg",
                        width: 11.2, height: 11.2, fit: BoxFit.scaleDown),
                  ),
                ),
              ),
              Text(
                'Đăng nhập Tuổi trẻ Đà Nẵng',
                style: AppTheme.HeadingTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

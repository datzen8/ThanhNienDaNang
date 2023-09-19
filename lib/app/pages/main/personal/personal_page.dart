import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/home/home_vm.dart';
import 'package:zen8app/app/pages/main/personal/personal_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../widgets/sources/custom_dialog.dart';

@RoutePage()
class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with MVVMBinding<PersonalVM, PersonalPage> {
  @override
  void onBindingVM(CompositeSubscription subscription) {}

  @override
  PersonalVM onCreateVM() {
    return PersonalVM();
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
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/empty_avatar.png',
                        ),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Session.currentUser!.fullName,
                style: AppTheme.HeadingTextStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                Session.currentUser!.mobile,
                style: AppTheme.smallTextStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  Session.currentUser!.email,
                style: AppTheme.smallTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              _buildItem(title: "Thông tin đoàn viên" ,subTitle: 'Xem thông tin tài khoản Đoàn viên',imageUrl:'assets/user.svg',page: ProfileRoute()),
              SizedBox(
                height: 20,
              ),
              _buildItem(title: 'Đổi mật khẩu',subTitle: 'Đổi mật khẩu đăng nhập',imageUrl: 'assets/lock.svg',page: const ChangePasswordRoute()),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                        return CustomDialog(
                          title: "Đăng xuất",description: "Bạn có chắc chắn muốn đăng xuất khỏi ứng dụng?",
                          rightAction: DialogAction(
                            title: "Đăng xuất",
                            onTap: logout ,
                          ),
                          leftAction: DialogAction(
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            title: "Hủy",
                            onTap: () => Navigator.pop(context),
                          ),
                        );
                      });
                  },
                  child: Text("Đăng xuất", style: AppTheme.smallTextStyle()))
            ],
          ),
        ));
  }
  void logout(){
    EventBus.shared
        .post(event: AppEvent.forceLogout, data: "User log out");
  }

  Widget _buildItem({required String title, required String subTitle, required String imageUrl ,required PageRouteInfo page}) {
    return InkWell(
      onTap: (){
        context.router.push(page);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.greyColor, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
            title: Text(
              title,
              style: AppTheme.smallTextStyle()
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(subTitle,
                style: AppTheme.smallTextStyle().copyWith(fontSize: 13)),
            leading: SvgPicture.asset(
                imageUrl ,height: 32,width: 26,fit: BoxFit.fitWidth,) ,
          titleAlignment: ListTileTitleAlignment.center,// Set your desired leading icon
            ),
      ),
    );
  }
}
//

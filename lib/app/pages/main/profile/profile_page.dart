import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/profile/profile_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/helpers/default_instance.dart';
import 'package:zen8app/utils/helpers/mvvm_binding.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import '../../../../core/sources/app_theme.dart';
import '../../../../models/sources/profile/profile.dart';
import '../../../../models/sources/profile_options/profile_options.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with MVVMBinding<ProfileVM, ProfilePage> {
  Profile profile = DefaultEmptyInstant.emptyProfile;
  ProfileOptions profileOptions = DefaultEmptyInstant.profileOptions;

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.respone.listen((value) {
      setState(() {
        profile = value.profile;
        profileOptions = value.listOptions;
      });
    }).addTo(subscription);

    _reload();
  }

  void _reload() {
    vm.input.reload.add(null);
  }

  @override
  ProfileVM onCreateVM() => ProfileVM();
  Widget _buildSetion({required String title, String value = ""}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(bottom: 15, top: 15, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFDDDDDD), width: 0.5),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style:
                  AppTheme.smallTextStyle().copyWith(color: Color(0xFF8A8A8A)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadingSection(String title, {required PageRouteInfo page}) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          Text(title,
              style: AppTheme.smallTextStyle().copyWith(
                  color: Color(0xFF8A8A8A), fontWeight: FontWeight.w500)),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              context.router.push(page);
            },
            child: Image.asset(
              "images/blue-pencil.png",
              width: 16,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              context.router.push(page);
            },
            child: Text("Chỉnh sửa",
                style: AppTheme.smallTextStyle().copyWith(
                    color: AppTheme.primaryColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      error: vm.errorTracker.asAppException(),
      refreshController: RefreshController(
          refreshOnStart: true,
          onRefresh: () async {
            _reload();
            return true;
          }),
      emptyStateBuilder: (context) => Container(),
      child: Scaffold(
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
              title: Text(
                "Thông tin đoàn viên",
                style: AppTheme.textStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              centerTitle: true),
          body: SingleChildScrollView(
              child: Column(
            children: [
              _buildHeadingSection("Thông tin cá nhân",
                  page: EditProfileRoute(
                      profile: profile, options: profileOptions)),
              _buildSetion(title: "Họ tên", value: profile.fullName),
              _buildSetion(title: "Số điện thoại", value: profile.mobile),
              _buildSetion(title: "Email", value: profile.email),
              _buildSetion(title: "Số CCCD", value: profile.idNumber),
              _buildSetion(
                  title: "Ngày cấp",
                  value: profile.idIssuedDate.ex
                      .asString(DatePattern.yyMMyyyyHHmm)),
              _buildSetion(
                  title: "Dân tộc", value: profile.ethnicObj.ex.getLabel()),
              _buildSetion(
                  title: "Giới tính", value: profile.genderObj.ex.getLabel()),
              _buildSetion(title: "Nơi cấp", value: profile.idIssuedPlace),
              _buildSetion(
                  title: "Ngày sinh",
                  value: profile.dob.ex.asString(DatePattern.yyMMyyyyHHmm)),
              _buildSetion(title: "Quê quán", value: profile.placeOfOrigin),
              _buildSetion(
                  title: "Địa chỉ thường trú", value: profile.placeOfResidence),
              _buildSetion(
                  title: "Tôn giáo", value: profile.religionObj.ex.getLabel()),
              _buildSetion(
                  title: "Nghề nghiệp",
                  value: profile.occupationObj.ex.getLabel()),
              Container(
                height: 20,
                color: Color(0xFFF5F5F5),
              ),
              _buildHeadingSection("Thông tin Đoàn",
                  page: EditOrganizationRoute(
                      profile: profile!, options: profileOptions)),
              _buildSetion(
                  title: "Chức vụ trong đoàn",
                  value: profile.positionObj.ex.getLabel()),
              _buildSetion(
                  title: "Ngày vào Đoàn", value: profile.joinedDate.toString()),
              _buildSetion(
                  title: "Nơi sinh hoạt Đoàn", value: profile.placeOfResidence),
              Container(
                height: 20,
                color: Color(0xFFF5F5F5),
              ),
              _buildHeadingSection("Thông tin học vấn",
                  page: EditProfileRoute(
                      profile: profile, options: profileOptions)),
              _buildSetion(
                  title: "Trình độ văn hóa",
                  value: profile.educationLevelObj.ex.getLabel()),
              _buildSetion(
                title: "Trình độ chuyên môn",
                value: profile.politicalTheoryLevelObj.ex.getLabel(),
              ),
              _buildSetion(
                title: "Trình độ tin học",
                value: profile.itLevelObj.ex.getLabel(),
              ),
              _buildSetion(
                title: "Trình độ ngoại ngữ",
                value: profile.foreignLanguageLevelObj.ex.getLabel(),
              ),
              _buildSetion(
                title: "Lý luận chính trị",
                value: profile.politicalTheoryLevelObj.ex.getLabel(),
              ),
            ],
          ))),
    );
  }
}

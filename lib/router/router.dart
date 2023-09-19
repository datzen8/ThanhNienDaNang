import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zen8app/app/pages/auth/signup/signup_page.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/app/pages/auth/login/login_page.dart';
import 'package:zen8app/app/pages/main/home/home_page.dart';

import '../app/pages/auth/forgot_pasword/forgot_password_page.dart';
import '../app/pages/main/campaign/campaign_detail_page.dart';
import '../app/pages/main/campaign/campaign_page.dart';
import '../app/pages/main/contest/contest_detail_page.dart';
import '../app/pages/main/exam/exam_page.dart';
import '../app/pages/main/exam/exam_result_detail_page.dart';
import '../app/pages/main/exam/exam_result_page.dart';
import '../app/pages/main/news/list_news_category_page.dart';
import '../app/pages/main/news/news_detail_page.dart';
import '../app/pages/main/news/news_page.dart';
import '../app/pages/main/personal/change_password_page.dart';
import '../app/pages/main/personal/personal_page.dart';
import '../app/pages/main/profile/edit_organization/edit_organization_page.dart';
import '../app/pages/main/profile/edit_profile/edit_profile_page.dart';
import '../app/pages/main/profile/profile_page.dart';
import '../models/sources/contest/contest.dart';
import '../models/sources/exam/exam.dart';
import '../models/sources/profile/profile.dart';
import '../models/sources/profile_options/profile_options.dart';
import '../models/sources/result/result.dart';
import '../widgets/sources/custom_dialog.dart';
import '../widgets/sources/photo_view_container.dart';
export 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (Session.isLoggedIn) {
      resolver.next(true);
    } else {
      showDialog(
          context: router.navigatorKey.currentContext!,
          builder: (context) {
            return CustomDialog(
              title: "Thông báo",
              description:
                  "Bạn cần đăng nhập tài khoản Đoàn viên để thực hiện thao tác này.",
              rightAction: DialogAction(
                  title: "Đăng nhập", onTap: () => router.replaceAll([const HomeRoute(), const LoginRoute()],updateExistingRoutes: false)),
            );
          });
      // EventBus.shared.post(event: AppEvent.showAuthDialog ,data: "User don't have permission");
    }
  }
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: PersonalRoute.page, guards: [AuthGuard()]),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: NewsRoute.page),
    AutoRoute(page: NewsDetailRoute.page),
    AutoRoute(page: CampaignDetailRoute.page),
    AutoRoute(page: ContestDetailRoute.page,),
    AutoRoute(page: PhotoViewContainerRoute.page),
    AutoRoute(page: CampaignRoute.page),
    CustomRoute(page: ListNewCategoryRoute.page,transitionsBuilder: TransitionsBuilders.slideLeft,durationInMilliseconds: 100,),
    AutoRoute(page: ExamRoute.page,guards: [AuthGuard()]),
    AutoRoute(page: ResultRoute.page,),
    AutoRoute(page: DetailResultRoute.page),
    AutoRoute(page: EditOrganizationRoute.page)

  ];
}

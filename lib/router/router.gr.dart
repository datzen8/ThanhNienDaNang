// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    CampaignDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CampaignDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CampaignDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsPage(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordPage(),
      );
    },
    PersonalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfilePage(
          key: args.key,
          profile: args.profile,
          options: args.options,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    PhotoViewContainerRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewContainerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhotoViewContainerPage(
          key: args.key,
          imageUrl: args.imageUrl,
        ),
      );
    },
    CampaignRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CampaignPage(),
      );
    },
    ListNewCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListNewCategoryPage(),
      );
    },
    ContestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ContestDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContestDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ExamRoute.name: (routeData) {
      final args =
          routeData.argsAs<ExamRouteArgs>(orElse: () => const ExamRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExamPage(
          key: args.key,
          contestId: args.contestId,
        ),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultPage(
          key: args.key,
          result: args.result,
          contest: args.contest,
          exam: args.exam,
        ),
      );
    },
    DetailResultRoute.name: (routeData) {
      final args = routeData.argsAs<DetailResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailResultPage(
          key: args.key,
          exam: args.exam,
        ),
      );
    },
    EditOrganizationRoute.name: (routeData) {
      final args = routeData.argsAs<EditOrganizationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditOrganizationPage(
          key: args.key,
          profile: args.profile,
          options: args.options,
        ),
      );
    },
  };
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CampaignDetailPage]
class CampaignDetailRoute extends PageRouteInfo<CampaignDetailRouteArgs> {
  CampaignDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CampaignDetailRoute.name,
          args: CampaignDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CampaignDetailRoute';

  static const PageInfo<CampaignDetailRouteArgs> page =
      PageInfo<CampaignDetailRouteArgs>(name);
}

class CampaignDetailRouteArgs {
  const CampaignDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CampaignDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const PageInfo<NewsDetailRouteArgs> page =
      PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalPage]
class PersonalRoute extends PageRouteInfo<void> {
  const PersonalRoute({List<PageRouteInfo>? children})
      : super(
          PersonalRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required Profile profile,
    required ProfileOptions options,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            profile: profile,
            options: options,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.profile,
    required this.options,
  });

  final Key? key;

  final Profile profile;

  final ProfileOptions options;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile, options: $options}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoViewContainerPage]
class PhotoViewContainerRoute
    extends PageRouteInfo<PhotoViewContainerRouteArgs> {
  PhotoViewContainerRoute({
    Key? key,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoViewContainerRoute.name,
          args: PhotoViewContainerRouteArgs(
            key: key,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoViewContainerRoute';

  static const PageInfo<PhotoViewContainerRouteArgs> page =
      PageInfo<PhotoViewContainerRouteArgs>(name);
}

class PhotoViewContainerRouteArgs {
  const PhotoViewContainerRouteArgs({
    this.key,
    required this.imageUrl,
  });

  final Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'PhotoViewContainerRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [CampaignPage]
class CampaignRoute extends PageRouteInfo<void> {
  const CampaignRoute({List<PageRouteInfo>? children})
      : super(
          CampaignRoute.name,
          initialChildren: children,
        );

  static const String name = 'CampaignRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListNewCategoryPage]
class ListNewCategoryRoute extends PageRouteInfo<void> {
  const ListNewCategoryRoute({List<PageRouteInfo>? children})
      : super(
          ListNewCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListNewCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContestDetailPage]
class ContestDetailRoute extends PageRouteInfo<ContestDetailRouteArgs> {
  ContestDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ContestDetailRoute.name,
          args: ContestDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ContestDetailRoute';

  static const PageInfo<ContestDetailRouteArgs> page =
      PageInfo<ContestDetailRouteArgs>(name);
}

class ContestDetailRouteArgs {
  const ContestDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'ContestDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ExamPage]
class ExamRoute extends PageRouteInfo<ExamRouteArgs> {
  ExamRoute({
    Key? key,
    dynamic contestId,
    List<PageRouteInfo>? children,
  }) : super(
          ExamRoute.name,
          args: ExamRouteArgs(
            key: key,
            contestId: contestId,
          ),
          initialChildren: children,
        );

  static const String name = 'ExamRoute';

  static const PageInfo<ExamRouteArgs> page = PageInfo<ExamRouteArgs>(name);
}

class ExamRouteArgs {
  const ExamRouteArgs({
    this.key,
    this.contestId,
  });

  final Key? key;

  final dynamic contestId;

  @override
  String toString() {
    return 'ExamRouteArgs{key: $key, contestId: $contestId}';
  }
}

/// generated route for
/// [ResultPage]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required Result result,
    required Contest contest,
    required Exam exam,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            result: result,
            contest: contest,
            exam: exam,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.result,
    required this.contest,
    required this.exam,
  });

  final Key? key;

  final Result result;

  final Contest contest;

  final Exam exam;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, result: $result, contest: $contest, exam: $exam}';
  }
}

/// generated route for
/// [DetailResultPage]
class DetailResultRoute extends PageRouteInfo<DetailResultRouteArgs> {
  DetailResultRoute({
    Key? key,
    required Exam exam,
    List<PageRouteInfo>? children,
  }) : super(
          DetailResultRoute.name,
          args: DetailResultRouteArgs(
            key: key,
            exam: exam,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailResultRoute';

  static const PageInfo<DetailResultRouteArgs> page =
      PageInfo<DetailResultRouteArgs>(name);
}

class DetailResultRouteArgs {
  const DetailResultRouteArgs({
    this.key,
    required this.exam,
  });

  final Key? key;

  final Exam exam;

  @override
  String toString() {
    return 'DetailResultRouteArgs{key: $key, exam: $exam}';
  }
}

/// generated route for
/// [EditOrganizationPage]
class EditOrganizationRoute extends PageRouteInfo<EditOrganizationRouteArgs> {
  EditOrganizationRoute({
    Key? key,
    required Profile profile,
    required ProfileOptions options,
    List<PageRouteInfo>? children,
  }) : super(
          EditOrganizationRoute.name,
          args: EditOrganizationRouteArgs(
            key: key,
            profile: profile,
            options: options,
          ),
          initialChildren: children,
        );

  static const String name = 'EditOrganizationRoute';

  static const PageInfo<EditOrganizationRouteArgs> page =
      PageInfo<EditOrganizationRouteArgs>(name);
}

class EditOrganizationRouteArgs {
  const EditOrganizationRouteArgs({
    this.key,
    required this.profile,
    required this.options,
  });

  final Key? key;

  final Profile profile;

  final ProfileOptions options;

  @override
  String toString() {
    return 'EditOrganizationRouteArgs{key: $key, profile: $profile, options: $options}';
  }
}

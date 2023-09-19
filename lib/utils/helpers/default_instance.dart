import 'package:zen8app/models/sources/campaign/campaign.dart';
import 'package:zen8app/models/sources/news_detail/news_detail.dart';
import 'package:zen8app/models/sources/option/option.dart';
import 'package:zen8app/models/sources/profile/profile.dart';
import 'package:zen8app/models/sources/profile_options/profile_options.dart';

class DefaultEmptyInstant {
  DefaultEmptyInstant._();
  static Profile emptyProfile = Profile(
      id: 1,
      createdAt: DateTime(2),
      updatedAt: DateTime.now(),
      placeOfOrigin: '',
      placeOfResidence: '',
      fullName: "",
      user: 0,
      email: "",
      mobile: "",
      positionObj: null,
      occupationObj: null,
      organizationObj: null,
      ethnicObj: null,
      religionObj: null,
      educationLevelObj: null,
      qualificationObj: null,
      itLevelObj: null,
      foreignLanguageLevelObj: null,
      politicalTheoryLevelObj: null,
      genderObj: null);

  static ProfileOptions profileOptions =
      ProfileOptions([], [], [], [], [], [], [], [], [], []);

  static NewsDetail newsDetail = NewsDetail(
      id: 1,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      type: 1,
      status: 1,
      title: '',
      content: '',
      coverImage: '',
      createdBy: 1,
      updatedBy: 1,
      categories: [],
      categoriesObj: [],
      typeObj: Option("", 1),
      createdByObj: Option("", 1));

  static Campaign emptyCampainDetail = Campaign(
      0,
      DateTime.now(),
      DateTime.now(),
      '',
      '',
      1,
      '',
      '',
      DateTime.now(),
      DateTime.now(),
      '',
      [],
      1,
      'contactEmail',
      '',
      1,
      1,
      [],
      Option("1", 1),
      Option("1", 1),
      [],
      Option("", 1),
      []);
}

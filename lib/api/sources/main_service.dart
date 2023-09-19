import 'dart:convert';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/campaign/campaign.dart';
import 'package:zen8app/models/sources/category/category.dart';
import 'package:zen8app/models/sources/get_campain_response/get_campaign_response.dart';
import 'package:zen8app/models/sources/get_contest_response/get_contest_response.dart';
import 'package:zen8app/models/sources/get_news_response/get_news_response.dart';
import 'package:zen8app/models/sources/news_detail/news_detail.dart';
import 'package:zen8app/models/sources/profile/profile.dart';
import 'package:zen8app/models/sources/search_organization_response/search_organization_response.dart';
import 'package:zen8app/models/sources/submit_response/submit_response.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/models/models.dart';

import '../../models/sources/contest/contest.dart';
import '../../models/sources/exam/exam.dart';
import '../../models/sources/get_list_response/get_list_member_response.dart';
import '../../models/sources/news/news.dart';

class MainService {
  Stream<ListMemberResponse> getProfile() {
    return Session.authClient.getStream('/account/member/profile/',
        data: {}).decode((json) => ListMemberResponse.fromJson(json));
  }

  Stream<GetNewsResponse> getLastesNews() {
    return Session.authClient.getStream('/article/news/', queryParameters: {
      "type": 2,
      "page_size": 10,
    }, data: {}).decode((json) => GetNewsResponse.fromJson(json));
  }

  Stream<Page<News>> getLatestNewsPagination(int page) {
    return Session.authClient
        .getStream('/article/news/', data: {}, queryParameters: {}).decode(
            (json) => Page<News>.fromJson(page, json, News.fromJson));
  }

  Stream<GetNewsResponse> getFeatureNews() {
    return Session.authClient.getStream('/article/news/', queryParameters: {
      "type": 1,
      "page_size": 10,
    }, data: {}).decode((json) => GetNewsResponse.fromJson(json));
  }

  Stream<NewsDetail> getNewsDetail({required int id}) {
    return Session.authClient.getStream('/article/news/$id',
        queryParameters: {},
        data: {}).decode((json) => NewsDetail.fromJson(json));
  }

  Stream<GetNewsResponse> getRelatedNews({required int id}) {
    return Session.authClient.getStream('/article/news/related/$id',
        queryParameters: {},
        data: {}).decode((json) => GetNewsResponse.fromJson(json));
  }

  Stream<GetCampaignResponse> getCampigns() {
    return Session.authClient.getStream('/activity/campaign/',
        queryParameters: {},
        data: {}).decode((json) => GetCampaignResponse.fromJson(json));
  }

  Stream<GetCampaignResponse> getCampignsFilterByStatus({required int value}) {
    return Session.authClient.getStream('/activity/campaign/',
        queryParameters: {"status": value},
        data: {}).decode((json) => GetCampaignResponse.fromJson(json));
  }

  Stream<Campaign> getCampainDetail({required int id}) {
    return Session.authClient.getStream('/activity/campaign/$id',
        data: {}).decode((json) => Campaign.fromJson(json));
  }

  Stream<GetContestResponse> getContests() {
    return Session.authClient.getStream('/activity/contest/',
        data: {}).decode((json) => GetContestResponse.fromJson(json));
  }

  Stream<Contest> getContestDetail({required int id}) {
    return Session.authClient.getStream('/activity/contest/$id',
        data: {}).decode((json) => Contest.fromJson(json));
  }

  Stream<Exam> createExam({required int contestId}) {
    return Session.authClient.postStream('/activity/exam/',
        data: {"contest": contestId}).decode((json) => Exam.fromJson(json));
  }

  Stream<SubmitResponse> submitExam(
      {required int exam, required List<Map> data}) {
    return Session.authClient
        .putStream('/activity/exam/submit/$exam', data: data)
        .decode((json) => SubmitResponse.fromJson(json));
  }

  Stream<SubmitResponse> getExamResult({required int exam}) {
    return Session.authClient.getStream('/activity/exam/detail/$exam',
        data: {}).decode((json) => SubmitResponse.fromJson(json));
  }

  Stream<List<Category>> getCategories() {
    return Session.authClient.getStream('/article/category/',
        data: {}).decodeList((json) => Category.fromJson(json));
  }

  Stream<SearchOrganizationResponse> searchOrganization(
      {required String searchValue}) {
    return Session.authClient.getStream('/dropdown/organization/',
        queryParameters: {"search": searchValue},
        data: {}).decode((json) => SearchOrganizationResponse.fromJson(json));
  }

  Stream<Profile> updateProfile({required Map<String, dynamic> data}) {
    return Session.authClient
        .putStream('/account/member/profile/', data: data)
        .decode((json) => Profile.fromJson(json));
  }
}

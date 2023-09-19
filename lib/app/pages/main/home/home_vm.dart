import 'package:rxdart/rxdart.dart';
import 'package:zen8app/api/api.dart';
import 'package:zen8app/models/sources/get_campain_response/get_campaign_response.dart';
import 'package:zen8app/models/sources/get_contest_response/get_contest_response.dart';
import 'package:zen8app/models/sources/get_news_response/get_news_response.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/models/models.dart';

class HomeVMInput extends Disposable {
  final loadFeaturePost = PublishSubject();
  final loadNormalPost = PublishSubject();
  final loadCampaign = PublishSubject();
  final loadContest = PublishSubject();

  @override
  void dispose() {
    loadNormalPost.close();
    loadFeaturePost.close();
    loadCampaign.close();
    loadContest.close();
  }
}

class HomeVMOutput extends Disposable {
  final getNormalNews = BehaviorSubject<GetNewsResponse>();
  final getFeatureNews = BehaviorSubject<GetNewsResponse>();
  final getCampaign = BehaviorSubject<GetCampaignResponse>();
  final getContest = BehaviorSubject<GetContestResponse>();

  @override
  void dispose() {
    getNormalNews.close();
    getFeatureNews.close();
    getCampaign.close();getContest.close();
  }
}

class HomeVM extends BaseVM<HomeVMInput, HomeVMOutput> {
  HomeVM() : super(HomeVMInput(), HomeVMOutput());

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.loadNormalPost
        .switchMap((value) => mainService
            .getLastesNews()
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.getNormalNews)
        .addTo(subscription);

    input.loadFeaturePost
        .switchMap((value) => mainService
            .getFeatureNews()
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.getFeatureNews)
        .addTo(subscription);

    input.loadCampaign
        .switchMap((value) => mainService
            .getCampigns()
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.getCampaign)
        .addTo(subscription);

    input.loadContest
        .switchMap((value) => mainService
            .getContests()
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.getContest)
        .addTo(subscription);

    return subscription;
  }
}

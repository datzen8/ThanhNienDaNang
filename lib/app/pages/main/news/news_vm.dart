import 'package:rxdart/rxdart.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/helpers/page_loader.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../models/sources/get_news_response/get_news_response.dart';
import '../../../../models/sources/news/news.dart';
import '../../../../models/sources/page.dart';
import '../../../../utils/helpers/activity_tracker.dart';
import '../../../../utils/helpers/base_vm.dart';
import '../../../../utils/helpers/di.dart';

class NewsVMInput extends Disposable {
  final loadFeaturePost = PublishSubject();
  final loadNormalPost = PublishSubject();

  @override
  void dispose() {
    loadFeaturePost.close();
    loadNormalPost.close();
  }
}

class NewsVMOutput extends Disposable {
  final getNormalNews = BehaviorSubject<GetNewsResponse>();
  final getFeatureNews = BehaviorSubject<GetNewsResponse>();

  @override
  void dispose() {
    getNormalNews.close();
    getFeatureNews.close();
  }
}

class NewsVM extends BaseVM<NewsVMInput, NewsVMOutput> {
  NewsVM() : super(NewsVMInput(), NewsVMOutput());
  var mainService = DI.resolve<MainService>();

  late PageLoader<int?, Page<News>> pageLoader =
      PageLoader<int?, Page<News>>((param, pages) {
    int nextPagr = (pages.lastOrNull?.index ?? 0) + 1;
    return mainService.getLatestNewsPagination(nextPagr);
  });

  Future<bool> loadMore() {
    return pageLoader.loadMorePage();
  }

  Future<bool> refresh() {
    return pageLoader.refreshPage(null);
  }
  @override
  PublishSubject get errorTracker => pageLoader.errorTracker;

  @override

  ActivityTracker get activityTracker => pageLoader.activityTracker;

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();

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

    return subscription;
  }
}

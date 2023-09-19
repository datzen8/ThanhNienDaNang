import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/get_news_response/get_news_response.dart';
import 'package:zen8app/models/sources/news_detail/news_detail.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../utils/helpers/di.dart';

class NewsDetailVMInput extends Disposable {
  final reload = PublishSubject<int>();
  final relate = PublishSubject<int>();

  @override
  void dispose() {
    reload.close();
    relate.close();
  }
}

class NewsDetailVMOutput extends Disposable {
  final response = BehaviorSubject<NewsDetail>();
  final relatedNews = BehaviorSubject<GetNewsResponse>();

  @override
  void dispose() {
    response.close();
    relatedNews.close();
  }
}

class NewsDetailVm extends BaseVM<NewsDetailVMInput, NewsDetailVMOutput> {
  NewsDetailVm() : super(NewsDetailVMInput(), NewsDetailVMOutput());

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

     input.reload
        .switchMap((value) => mainService
            .getNewsDetail(id: value)
            .trackActivity("loading", activityTracker))
        .bindTo(output.response)
        .addTo(subscription);

    input.relate
        .switchMap((value) => mainService
            .getRelatedNews(id: value)
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.relatedNews)
        .addTo(subscription);

    return subscription;
  }
}

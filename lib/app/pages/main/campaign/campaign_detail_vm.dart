import 'package:rxdart/rxdart.dart';
import 'package:zen8app/api/api.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/di.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../models/sources/campaign/campaign.dart';

class CampaignDetailVMInput extends Disposable {
  final reload = PublishSubject<int>();
  @override
  void dispose() {
    // TODO: implement dispose
    reload.close();
  }
}

class CampaignDetailVMOutput extends Disposable {
  final getDetail = BehaviorSubject<Campaign>();

  @override
  void dispose() {
    getDetail.close();
  }
}

class CampaignDetailVM
    extends BaseVM<CampaignDetailVMInput, CampaignDetailVMOutput> {
  CampaignDetailVM() : super(CampaignDetailVMInput(), CampaignDetailVMOutput());

  @override
  CompositeSubscription? connect() {
    CompositeSubscription subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.reload
        .switchMap((value) => mainService
            .getCampainDetail(id: value)
            .trackActivity("loading", activityTracker)
            .handleErrorBy(errorTracker))
        .bindTo(output.getDetail)
        .addTo(subscription);
  }
}

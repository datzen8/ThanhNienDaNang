import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/get_campain_response/get_campaign_response.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../utils/helpers/di.dart';

class CampaignListVMInput extends Disposable {
  final reload = PublishSubject<int>();

  @override
  void dispose() {
    reload.close();
  }
}

class CampaignListVMOutput extends Disposable {
  final response = BehaviorSubject<GetCampaignResponse>();

  @override
  void dispose() {
    response.close();
  }
}

class CampaignListVM extends BaseVM<CampaignListVMInput, CampaignListVMOutput> {
  CampaignListVM() : super(CampaignListVMInput(), CampaignListVMOutput());

  @override
  CompositeSubscription? connect() {
    CompositeSubscription subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.reload
        .switchMap((value) => mainService.getCampignsFilterByStatus(value: value).trackActivity("loading", activityTracker).handleErrorBy(errorTracker))
        .bindTo(output.response)
        .addTo(subscription);

    return subscription;
  }
}

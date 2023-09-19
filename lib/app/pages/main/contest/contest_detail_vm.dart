import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/submit_response/submit_response.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../models/sources/contest/contest.dart';
import '../../../../utils/helpers/base_vm.dart';
import '../../../../utils/helpers/di.dart';

class ContestDetailVMInput extends Disposable {
  final reload = PublishSubject<int>();
  final reloadResult = PublishSubject<int>();

  @override
  void dispose() {
    reload.close();
    reloadResult.close();
  }
}

class ContestDetailVMOutput extends Disposable {
  final response = BehaviorSubject<Contest>();
  final resultResponse = BehaviorSubject<SubmitResponse>();

  @override
  void dispose() {
    response.close();
  }
}

class ContestDetailVm
    extends BaseVM<ContestDetailVMInput, ContestDetailVMOutput> {
  ContestDetailVm() : super(ContestDetailVMInput(), ContestDetailVMOutput());

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.reload
        .switchMap((value) => mainService
            .getContestDetail(id: value)
            .trackActivity("loading", activityTracker))
        .bindTo(output.response)
        .addTo(subscription);
    input.reloadResult
        .switchMap((value) => mainService
            .getExamResult(exam: value)
            .handleErrorBy(errorTracker)
            .trackActivity("loading", activityTracker))
        .bindTo(output.resultResponse)
        .addTo(subscription);

    return subscription;
  }
}

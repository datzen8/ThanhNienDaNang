import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/submit_response/submit_response.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../models/sources/exam/exam.dart';
import '../../../../utils/helpers/di.dart';

class ExamVMInput extends Disposable {
  final reload = PublishSubject<int>();
  final submit = PublishSubject<(List<Map>, int)>();
  @override
  void dispose() {
    reload.close();
    submit.close();
  }
}

class ExamVMOutput extends Disposable {
  final respnonse = BehaviorSubject<Exam>();
  final submitResponse = BehaviorSubject<SubmitResponse>();

  @override
  void dispose() {
    respnonse.close();
  }
}

class ExamVM extends BaseVM<ExamVMInput, ExamVMOutput> {
  ExamVM() : super(ExamVMInput(), ExamVMOutput());

  @override
  CompositeSubscription? connect() {
    CompositeSubscription subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.reload
        .switchMap((value) => mainService
            .createExam(contestId: value)
            .handleErrorBy(errorTracker)
            .trackActivity("loading", activityTracker))
        .bindTo(output.respnonse)
        .addTo(subscription);

    input.submit
        .switchMap((value) => mainService
            .submitExam(exam: value.$2, data: value.$1)
            .handleErrorBy(errorTracker)
            .trackActivity('loading', activityTracker))
        .bindTo(output.submitResponse)
        .addTo(subscription);

    return subscription;
  }
}

import 'package:rxdart/rxdart.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../api/sources/auth_service.dart';
import '../../../../utils/helpers/di.dart';

class ForgotPasswordVMInput extends Disposable{
  final forgot = PublishSubject<String>();

  @override
  void dispose() {
    // TODO: implement dispose
    forgot.close();
  }
}

class ForgotPasswordVMOutput extends Disposable{

  final response = PublishSubject<String>();

  @override
  void dispose() {
    // TODO: implement dispose
    response.close();
  }

}

class ForgotPasswordVM extends BaseVM<ForgotPasswordVMInput,ForgotPasswordVMOutput>{

  ForgotPasswordVM() :super(ForgotPasswordVMInput(),ForgotPasswordVMOutput());

  @override
  CompositeSubscription? connect() {
    final subscription = CompositeSubscription();
    final authService = DI.resolve<AuthService>();

    input.forgot
        .switchMap((param) => authService
        .forgotPassword(param)
        .trackActivity("loading", activityTracker))
        .handleErrorBy(errorTracker)
        .bindTo(output.response)
        .addTo(subscription);

    return subscription;

  }
}
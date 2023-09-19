import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/login_response/login_response.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../api/sources/auth_service.dart';
import '../../../../utils/helpers/di.dart';

class SignUpVMInput extends Disposable{
  final signup = PublishSubject<Map<String,String>>();

  @override
  void dispose() {
    // TODO: implement dispose
    signup.close();
  }
}

class SignupVMOutput extends Disposable{

  final response = PublishSubject<LoginResponse>();

  @override
  void dispose() {
    response.close();
  }

}

class SignupVM extends BaseVM<SignUpVMInput,SignupVMOutput>{
  SignupVM() :super(SignUpVMInput(),SignupVMOutput());
  
  @override
  CompositeSubscription? connect() {
    final subscription = CompositeSubscription();
    final authService = DI.resolve<AuthService>();
    
    input.signup.switchMap((value) => authService.register(value)
        .trackActivity("loading",activityTracker)).handleErrorBy(errorTracker).bindTo(output.response).addTo(subscription);
    return subscription;
  }
}
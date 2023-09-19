import 'package:rxdart/rxdart.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../api/sources/auth_service.dart';
import '../../../../utils/helpers/di.dart';

class ChangePasswordVMInput extends Disposable{
  final changePassword = PublishSubject<(String, String)>();

  @override
  void dispose() {
    changePassword.close();
  }

}

class ChangPasswordVMOutput extends Disposable{
  final response = PublishSubject();

  void dispose() {
    response.close();
  }
}



class ChangePasswordVM extends BaseVM<ChangePasswordVMInput,ChangPasswordVMOutput>{
  ChangePasswordVM() :super(ChangePasswordVMInput(),ChangPasswordVMOutput());

  @override
  CompositeSubscription? connect() {
    final subscription = CompositeSubscription();
    final authService = DI.resolve<AuthService>();



    return subscription;



    return super.connect();
  }

}
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/api/api.dart';
import 'package:zen8app/models/sources/get_list_response/get_list_member_response.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../utils/helpers/di.dart';

class ProfileVMInput extends Disposable{
  final reload = PublishSubject();
  @override
  void dispose() {
    reload.close();
  }
}

class ProfileVMOutput extends Disposable{
  final respone = BehaviorSubject<ListMemberResponse>();
  @override
  void dispose() {
    respone.close();
  }
}

class ProfileVM extends BaseVM<ProfileVMInput,ProfileVMOutput> {
  ProfileVM() :super(ProfileVMInput(),ProfileVMOutput());

  @override
  CompositeSubscription? connect(){
  final subscription = CompositeSubscription();
  final mainService = DI.resolve<MainService>();

  input.reload
      .switchMap((param) => mainService
      .getProfile()
      .trackActivity("loading", activityTracker))
      .handleErrorBy(errorTracker).bindTo(output.respone).addTo(subscription);

  return subscription;
  }

}
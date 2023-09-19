import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/profile/profile.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../../api/sources/main_service.dart';
import '../../../../../utils/helpers/di.dart';

class EditProfileVMInput extends Disposable{
  final update = PublishSubject<Map<String, dynamic>>();

  @override
  void dispose() {
      update.close();
  }
}

class EditProfileVMOutput extends Disposable{
  final response = BehaviorSubject<Profile>();



  @override
  void dispose() {
    response.close();
  }
}

class EditProfileVM extends BaseVM<EditProfileVMInput,EditProfileVMOutput> {
  EditProfileVM(): super(EditProfileVMInput(),EditProfileVMOutput());

  @override
  CompositeSubscription? connect() {
    final subscription = CompositeSubscription();
    final mainService = DI.resolve<MainService>();

    if(output.response.isClosed){
      print('---> response is close');
    }

    input.update
        .switchMap((param) => mainService
        .updateProfile(data: param)
        .trackActivity("loading", activityTracker)).handleErrorBy(errorTracker)
        .bindTo(output.response).addTo(subscription);

    return subscription;
  }
  }

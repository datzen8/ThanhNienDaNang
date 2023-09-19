import 'package:rxdart/rxdart.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../utils/helpers/base_vm.dart';

class PersonalVMInput extends Disposable {}

class PersonalVMOutput extends Disposable {
  final posts = BehaviorSubject<List>();
  @override
  void dispose() {
    posts.close();
  }
}

class PersonalVM extends BaseVM<PersonalVMInput, PersonalVMOutput> {
  PersonalVM() : super(PersonalVMInput(), PersonalVMOutput());

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();

    return subscription;
  }
}

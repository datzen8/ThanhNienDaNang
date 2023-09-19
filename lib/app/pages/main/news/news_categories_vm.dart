import 'package:rxdart/rxdart.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';
import 'package:zen8app/utils/utils.dart';

import '../../../../api/sources/main_service.dart';
import '../../../../models/sources/category/category.dart';
import '../../../../utils/helpers/di.dart';

class CategoryVMINput extends Disposable {
  final reload = PublishSubject();
  @override
  void dispose() {
    // TODO: implement dispose
    reload.close();
  }
}

class CategoryVMOutput extends Disposable {
  final response = BehaviorSubject<List<Category>>();

  @override
  void dispose() {
    response.close();
  }
}

class CategoryVM extends BaseVM<CategoryVMINput, CategoryVMOutput> {
  CategoryVM() : super(CategoryVMINput(), CategoryVMOutput());

  @override
  CompositeSubscription? connect() {
    var subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.reload
        .switchMap((value) => mainService
            .getCategories()
            .handleErrorBy(errorTracker)
            .trackActivity("loading", activityTracker))
        .bindTo(output.response)
        .addTo(subscription);

    return subscription;
  }
}

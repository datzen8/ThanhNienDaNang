import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zen8app/models/sources/search_organization_response/search_organization_response.dart';
import 'package:zen8app/utils/extensions/stream_ext.dart';
import 'package:zen8app/utils/helpers/base_vm.dart';
import 'package:zen8app/utils/helpers/disposable.dart';

import '../../../../../api/sources/main_service.dart';
import '../../../../../utils/helpers/di.dart';

class SearchTextVMInput extends Disposable {
  final changeSearchText = PublishSubject<String>();

  @override
  void dispose() {
    changeSearchText.close();
  }
}

class SearchTextVMOutput extends Disposable {
  final response = BehaviorSubject<SearchOrganizationResponse>();

  @override
  void dispose() {
    response.close();
  }
}

class SearchTextVm extends BaseVM<SearchTextVMInput, SearchTextVMOutput> {
  SearchTextVm() : super(SearchTextVMInput(), SearchTextVMOutput());

  @override
  CompositeSubscription? connect() {
    CompositeSubscription subscription = CompositeSubscription();
    var mainService = DI.resolve<MainService>();

    input.changeSearchText
      .debounceTime(Duration(milliseconds: 300))
          .switchMap(
              (value) => mainService.searchOrganization(searchValue: value))
          .bindTo(output.response)
          .addTo(subscription);
    return subscription;
  }
}

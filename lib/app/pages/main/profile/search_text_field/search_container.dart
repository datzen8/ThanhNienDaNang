import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/profile/search_text_field/search_text_field.dart';
import 'package:zen8app/app/pages/main/profile/search_text_field/search_text_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';

import '../../../../../models/sources/organization/organization.dart';
import '../../../../../utils/helpers/mvvm_binding.dart';
import '../../../../../widgets/sources/loading_widget.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer>
    with MVVMBinding<SearchTextVm, SearchContainer> {
  List<Organization> organizations = [];
  final TextEditingController searchController = TextEditingController();
  Organization? selectOrganization;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              controller: searchController,
              onChanged: (value) {
                if (value != null) {
                  vm.input.changeSearchText.add(value);
                } else {
                  setState(() {
                    organizations = [];
                  });
                }
              },
              decoration: InputDecoration(
                  hintText: "Nhập nơi sinh hoạt đoàn viên",
                  helperText: "",
                  hintStyle: TextStyle(color: Color(0xFFA3A3A3)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1, color: AppTheme.greyColor),
                  ),
                  suffixIcon: Icon(Icons.search)),
            ),
            Expanded(
                child: LoadingWidget(
              isLoading: vm.activityTracker.isRunningAny(),
              error: vm.errorTracker.asAppException(),
              child: ListView.builder(
                itemCount: organizations.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    context.router.pop(organizations[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFDDDDDD), width: 0.5))),
                    child: Text(
                      organizations[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {
      setState(() {
        organizations = value.items;
      });
    }).addTo(subscription);
  }

  @override
  SearchTextVm onCreateVM() {
    return SearchTextVm();
  }
}

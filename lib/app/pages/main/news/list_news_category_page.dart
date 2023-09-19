import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/news/news_categories_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/router/router.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';

import '../../../../models/sources/category/category.dart';

@RoutePage()
class ListNewCategoryPage extends StatefulWidget {
  const ListNewCategoryPage({Key? key}) : super(key: key);

  @override
  State<ListNewCategoryPage> createState() => _ListNewCategoryPageState();
}

class _ListNewCategoryPageState extends State<ListNewCategoryPage>
    with MVVMBinding<CategoryVM, ListNewCategoryPage> {
  List<Category> categorys = [];
  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: vm.activityTracker.isRunningAny(),
      error: vm.errorTracker.asAppException(),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/news-category-cover.png",
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    top: 50,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/close.svg",
                            width: 11.2, height: 11.2, fit: BoxFit.scaleDown),
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'Danh mục tin tức',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ))
              ],
            ),
            Expanded(
                child: ListView.builder(

              itemCount: categorys.length,
              itemBuilder: (context, index) =>
                  _buildCategoryItem(categorys[index]),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Text(
        category.label.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {
      setState(() {
        categorys = value;
      });
    }).addTo(subscription);
    _reload();
  }

  void _reload() {
    vm.input.reload.add(null);
  }

  @override
  CategoryVM onCreateVM() {
    return CategoryVM();
  }
}

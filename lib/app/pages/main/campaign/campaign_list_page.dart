import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/campaign/campaign_page.dart';
import 'package:zen8app/app/pages/main/campaign/campain_list_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/utils/helpers/mvvm_binding.dart';
import 'package:zen8app/widgets/sources/home_section_card.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';

import '../../../../models/sources/campaign/campaign.dart';
import '../../../../widgets/sources/empty_wigdet.dart';

class CampaignListPage extends StatefulWidget {
  final CampaignStatus status;
  const CampaignListPage({Key? key, required this.status}) : super(key: key);

  @override
  State<CampaignListPage> createState() => _CampaignListPageState();
}

class _CampaignListPageState extends State<CampaignListPage>
    with MVVMBinding<CampaignListVM, CampaignListPage> {
  List<Campaign> campaigns = [];

  void _reload() {
    vm.input.reload.add(widget.status.value);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget.builder(
        isLoading: vm.activityTracker.isRunningAny(),
        error: vm.errorTracker.asAppException(),
        refreshController: RefreshController(
            refreshOnStart: true,
            onRefresh: () async {
              _reload();
              return true;
            }),
        emptyStateBuilder: (context) => campaigns.isNotEmpty
            ? null
            : EmptyWidget(type: EmptyType.contest,),
        builder: (context, physics) => Padding(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: GridView.builder(
                physics: physics,
                itemCount: campaigns.length,
                itemBuilder: (context, index) => SectionCard(
                  campaign: campaigns[index],
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (MediaQuery.of(context).size.width) / 2,
                    mainAxisExtent: 250),
              ),
            ));
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.response.listen((value) {
      setState(() {
        campaigns = value.items;
      });
    }).addTo(subscription);
    _reload();
  }

  @override
  CampaignListVM onCreateVM() {
    return CampaignListVM();
  }
}

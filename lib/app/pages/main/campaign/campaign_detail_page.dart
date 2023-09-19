import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/utils/composite_subscription.dart';
import 'package:zen8app/app/pages/main/campaign/campaign_detail_vm.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/campaign/campaign.dart';
import 'package:zen8app/utils/helpers/default_instance.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/widgets/sources/calendar_text.dart';
import 'package:zen8app/widgets/sources/default_network_image.dart';
import 'package:zen8app/widgets/sources/home_section_card.dart';
import 'package:zen8app/widgets/sources/loading_widget.dart';
import 'package:zen8app/widgets/sources/tag.dart';
import 'package:zen8app/widgets/sources/view_photo_wrap.dart';

import '../../../../core/sources/app_theme.dart';

@RoutePage()
class CampaignDetailPage extends StatefulWidget {
  final int id;
  const CampaignDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<CampaignDetailPage> createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage>
    with MVVMBinding<CampaignDetailVM, CampaignDetailPage> {
  Campaign _campaign = DefaultEmptyInstant.emptyCampainDetail;

  void reload() {
    vm.input.reload.add(widget.id);
  }

  @override
  void onBindingVM(CompositeSubscription subscription) {
    vm.output.getDetail.listen((value) {
      setState(() {
        _campaign = value;
      });
    }).addTo(subscription);

    reload();
  }

  @override
  CampaignDetailVM onCreateVM() {
    return CampaignDetailVM();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
        error: vm.errorTracker.asAppException(),
        emptyStateBuilder: (context) => Container(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.2,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              // leading: SvgPicture.asset('assets/left-arrow-optimized.svg',color: Colors.black,width: 16) ,
              title: Text(
                "Chi tiết đợt tình nguyện",
                style: AppTheme.textStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultNetworkImage(
                    imageUrl: _campaign.coverImage,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  _buildContent()
                ],
              ),
            )));
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Tag(
                  title: _campaign.typeObj.label,
                  backgroundColor: Color(0xFF00B191),
                  pathIcon: CampaignType.values[_campaign.type - 1].pathIcon),
              SizedBox(
                width: 10,
              ),
              Tag(
                  title: _campaign.statusObj.label,
                  backgroundColor: AppTheme.primaryColor)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _campaign.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 12,
          ),
          CalendarText(
            text: _campaign.createdAtToString(),
            size: 14,
          ),
          _buildContentItem(
              title: "Thời gian đăng ký",
              child: customExpanedText(_campaign.registerTimeToString()),
              pathIcon: 'images/blue-calendar.png'),
          _buildContentItem(
              title: "Thời gian diễn ra",
              child: customExpanedText(_campaign.occurringTime),
              pathIcon: 'images/blue-calendar.png'),
          _buildContentItem(
              title: "Địa điểm",
              child: customExpanedText(_campaign.place),
              pathIcon: 'images/blue-marker.png'),
          _buildContentItem(
              title: "Đối tượng thụ hưởng",
              child: customExpanedText(_campaign.beneficiariesToString),
              pathIcon: 'images/blue-users.png'),
          _buildContentItem(
            title: "Nội dung",
            pathIcon: 'images/blue-calendar.png',
            child: customExpanedText(_campaign.content),
          ),
          _buildContentItem(
            title: "Hình ảnh ",
            pathIcon: 'images/blue-picture.png',
            child: Wrap(
              spacing: 20,
              children: _campaign.images!
                  .map((e) => Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: ViewPhotoWrap(
                          imageUrl: e.url,
                          child: DefaultNetworkImage(
                            imageUrl: e.url,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          _buildContentItem(
            title: "Thông tin liên hệ",
            pathIcon: 'images/blue_circle-phone-flip.png',
            child: Column(
              children: [
                Row(children: [
                  Text("Số điện thoại:  ",
                      style: TextStyle(color: Colors.black)),
                  Text(_campaign.contactMobile),
                ]),
                Row(children: [
                  Text("Email:  ", style: TextStyle(color: Colors.black)),
                  Text(_campaign.contactEmail),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem(
      {required String title,
      required Widget child,
      required String pathIcon}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.3, color: Colors.grey.shade400))),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                pathIcon,
                width: 18,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget customExpanedText(String text) {
    return ExpandableText(text,
        expandText: "Xem thêm",
        prefixStyle: TextStyle(color: Color(0xFF005CE)),
        linkStyle: TextStyle(color: Color(0xFF005CE7)),
        maxLines: 4,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        collapseText: "Ẩn bớt");
  }
}

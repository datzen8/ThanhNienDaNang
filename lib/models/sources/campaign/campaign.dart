import 'package:json_annotation/json_annotation.dart';
import 'package:zen8app/core/core.dart';
import 'package:zen8app/models/sources/image_metadata/image_metadata.dart';
import 'package:zen8app/models/sources/option/option.dart';
import 'package:zen8app/utils/helpers/object_item.dart';
import 'package:zen8app/utils/utils.dart';

import '../attachment/attachment.dart';
part 'campaign.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Campaign extends ObjectItem {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String coverImage;
  int type;
  String content;
  String place;
  DateTime registrationFrom;
  DateTime registrationTo;
  String occurringTime;
  List<int> beneficiaryTypes;
  int status;
  List<ImageMetadata>? images;
  String contactEmail;
  String contactMobile;
  int createdBy;
  int updatedBy;
  Option typeObj;
  Option statusObj;
  List<Option> beneficiaryTypesObj;
  Option createdByObj;
  List<Attachment>? attachments;
  List<Attachment>? files;

  Campaign(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.coverImage,
      this.type,
      this.content,
      this.place,
      this.registrationFrom,
      this.registrationTo,
      this.occurringTime,
      this.beneficiaryTypes,
      this.status,
      this.contactEmail,
      this.contactMobile,
      this.createdBy,
      this.updatedBy,
      this.images,
      this.typeObj,
      this.statusObj,
      this.beneficiaryTypesObj,
      this.createdByObj,
      this.attachments);
  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignToJson(this);

  String formatOccurrringTime() {
    return "Từ ${registrationFrom.ex.asString(DatePattern.mmdd)} đến ${registrationTo.ex.asString(DatePattern.mmdd)} ";
  }

  String createdAtToString() {
    return "Đăng từ ${createdAt.ex.asString(DatePattern.mmdd)}";
  }

  String registerTimeToString() {
    return "Từ ${registrationFrom.ex.asString(DatePattern.mmdd)} đến ${registrationTo.ex.asString(DatePattern.mmdd)} ";
  }

  String get beneficiariesToString {
    String result = '';
    beneficiaryTypesObj.forEach((element) {
      result = result + element.label + ", ";
    });
    return result;
  }

  @override
  String get titleSection => "Đợt tình nguyện";
}

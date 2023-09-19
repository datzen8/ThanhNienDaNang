import 'package:json_annotation/json_annotation.dart';

import '../option/option.dart';


part 'profile.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int? ethnic;
  int? religion;
  int? educationLevel;
  int? qualification;
  int? itLevel;
  int? foreignLanguageLevel;
  int? politicalTheoryLevel;
  DateTime? dob;
  String placeOfOrigin;
  String placeOfResidence;
  String fullName;
  DateTime? joinedDate;
  int? gender;
  String idNumber;
  DateTime? idIssuedDate;
  String idIssuedPlace;
  int user;
  int? position;
  int? occupation;
  int? organization;
  String email;
  String mobile;
  Option? positionObj;
  
  Option? occupationObj;
  
  Option? organizationObj;
  Option? ethnicObj;
  
  Option? religionObj;
  
  Option? educationLevelObj;
  
  Option? qualificationObj;
  
  Option? itLevelObj;
  
  Option? foreignLanguageLevelObj;
  
  Option? politicalTheoryLevelObj;
  
  Option? genderObj;

  Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.ethnic,
    this.religion,
    this.educationLevel,
    this.qualification,
    this.itLevel,
    this.foreignLanguageLevel,
    this.politicalTheoryLevel,
    this.dob,
    required this.placeOfOrigin ,
    required this.placeOfResidence ,
    required this.fullName,
    this.joinedDate,
    this.gender,
    this.idNumber = "",
    this.idIssuedDate,
    this.idIssuedPlace = "",
    required this.user,
    this.position,
    this.occupation,
    this.organization,
    required this.email,
    required this.mobile,
    required this.positionObj,
    required this.occupationObj,
    required this.organizationObj,
    required this.ethnicObj,
    required this.religionObj,
    required this.educationLevelObj,
    required this.qualificationObj,
    required this.itLevelObj,
    required this.foreignLanguageLevelObj,
    required this.politicalTheoryLevelObj,
    required this.genderObj,
  });


  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';

import 'data.dart';

class UpadateProfileModel extends ProfileEntity {
  bool? success;
  ProfileUpdateData? data;
  String? message;

  UpadateProfileModel({this.success, this.data, this.message})
    : super(
        profileId: data?.id.toString() ?? '',
        userName: data?.name ?? '',
        userEmail: data?.email ?? '',
        userProfileImage: data?.profileImage,
      );

  factory UpadateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpadateProfileModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : ProfileUpdateData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

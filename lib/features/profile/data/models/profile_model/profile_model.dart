import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';

import 'data.dart';

class ProfileModel extends ProfileEntity {
  bool? success;
  Data? data;
  String? message;

  ProfileModel({this.success, this.data, this.message})
    : super(
        profileId: data?.id.toString() ?? '',
        userName: data?.name ?? '',
        userEmail: data?.email ?? '',
        userProfileImage: data?.profileImage,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

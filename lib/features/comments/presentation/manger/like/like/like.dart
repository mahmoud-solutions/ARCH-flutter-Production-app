import 'data.dart';

class LikeModelRespose {
  bool? success;
  LikeModel? data;
  String? message;

  LikeModelRespose({this.success, this.data, this.message});

  factory LikeModelRespose.fromJson(Map<String, dynamic> json) =>
      LikeModelRespose(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : LikeModel.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

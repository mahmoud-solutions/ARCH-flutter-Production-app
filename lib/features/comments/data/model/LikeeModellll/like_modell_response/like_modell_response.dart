import 'data.dart';

class LikeModelRespnse {
  bool? success;
  Data? data;
  String? message;

  LikeModelRespnse({this.success, this.data, this.message});

  factory LikeModelRespnse.fromJson(Map<String, dynamic> json) {
    return LikeModelRespnse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

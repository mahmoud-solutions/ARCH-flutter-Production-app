import 'data.dart';

class PostFavouriteResponse {
  bool? success;
  Data? data;
  String? message;

  PostFavouriteResponse({this.success, this.data, this.message});

  factory PostFavouriteResponse.fromJson(Map<String, dynamic> json) =>
      PostFavouriteResponse(
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

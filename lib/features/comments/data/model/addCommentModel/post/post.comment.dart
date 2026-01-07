import 'data.comment.dart';

class Post {
  bool? success;
  CommentModel? data;
  String? message;

  Post({this.success, this.data, this.message});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : CommentModel.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

import 'get_comment.dart';

class GetCommentRespose {
  bool? success;
  List<GetComment>? data;
  String? message;

  GetCommentRespose({this.success, this.data, this.message});

  factory GetCommentRespose.fromJson(Map<String, dynamic> json) =>
      GetCommentRespose(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => GetComment.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

class DeleteAllNotificationRespons {
  bool? success;
  List<dynamic>? data;
  String? message;

  DeleteAllNotificationRespons({this.success, this.data, this.message});

  factory DeleteAllNotificationRespons.fromJson(Map<String, dynamic> json) {
    return DeleteAllNotificationRespons(
      success: json['success'] as bool?,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data,
    'message': message,
  };
}

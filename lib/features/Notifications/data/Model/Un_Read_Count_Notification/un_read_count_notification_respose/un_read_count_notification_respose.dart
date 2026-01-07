import 'count_model.dart';

class UnReadCountNotificationRespose {
  bool? success;
  CountModel? data;
  String? message;

  UnReadCountNotificationRespose({this.success, this.data, this.message});

  factory UnReadCountNotificationRespose.fromJson(Map<String, dynamic> json) {
    return UnReadCountNotificationRespose(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CountModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

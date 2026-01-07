import 'login_datum.dart';

class LoginModel {
  bool? success;
  List<LogInDatum>? data;
  String? message;

  LoginModel({this.success, this.data, this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => LogInDatum.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

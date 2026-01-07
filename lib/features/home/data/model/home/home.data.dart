import 'data.data.dart';

class Home {
  bool? success;
  Dataa? data;
  String? message;

  Home({this.success, this.data, this.message});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : Dataa.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
  };
}

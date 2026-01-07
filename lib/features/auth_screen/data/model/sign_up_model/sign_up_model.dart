import 'datum.dart';

class SignUpModel {
  bool? success;
  List<Datum>? data;
  String? message;

  SignUpModel({this.success, this.data, this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

import 'banner.dart';

class BannerResponse {
  bool? success;
  List<Bannner>? data;
  String? message;

  BannerResponse({this.success, this.data, this.message});

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Bannner.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

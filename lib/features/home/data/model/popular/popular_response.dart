import 'popular_place.dart';

class PopularResponse {
  bool? success;
  List<PopularPlace>? data;
  String? message;

  PopularResponse({this.success, this.data, this.message});

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => PopularPlace.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

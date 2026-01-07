import 'get_favourite_model.dart';

class GetFavouriteResponse {
  bool? success;
  List<GetFavModel>? data;
  String? message;

  GetFavouriteResponse({this.success, this.data, this.message});

  factory GetFavouriteResponse.fromJson(Map<String, dynamic> json) =>
      GetFavouriteResponse(
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => GetFavModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
  };
}

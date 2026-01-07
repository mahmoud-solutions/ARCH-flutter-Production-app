class Data {
  bool? isFavorite;
  String? message;

  Data({this.isFavorite, this.message});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isFavorite: json['is_favorite'] as bool?,
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'is_favorite': isFavorite,
    'message': message,
  };
}

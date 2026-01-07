class GetFavModel {
  int? id;
  String? name;
  String? description;
  String? workDate;
  String? image;
  String? mapPhoto;
  double? lat;
  double? lang;
  int? popularPlaceId;
  String? governorateName;
  String? regionName;
  int? totalReviews;
  String? averageRating;

  GetFavModel({
    this.id,
    this.name,
    this.description,
    this.workDate,
    this.image,
    this.mapPhoto,
    this.lat,
    this.lang,
    this.popularPlaceId,
    this.governorateName,
    this.regionName,
    this.totalReviews,
    this.averageRating,
  });

  factory GetFavModel.fromJson(Map<String, dynamic> json) => GetFavModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    workDate: json['work_date'] as String?,
    image: json['image'] as String?,
    mapPhoto: json['map_photo'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lang: (json['lang'] as num?)?.toDouble(),
    popularPlaceId: json['popular_place_id'] as int?,
    governorateName: json['governorate_name'] as String?,
    regionName: json['region_name'] as String?,
    totalReviews: json['total_reviews'] as int?,
    averageRating: json['average_rating'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'work_date': workDate,
    'image': image,
    'map_photo': mapPhoto,
    'lat': lat,
    'lang': lang,
    'popular_place_id': popularPlaceId,
    'governorate_name': governorateName,
    'region_name': regionName,
    'total_reviews': totalReviews,
    'average_rating': averageRating,
  };
}

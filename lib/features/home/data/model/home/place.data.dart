class Place {
  int? id;
  String? name;
  String? description;
  String? image;
  String? mapPhoto;
  String? governorateName;
  String? regionName;
  String? rate;
  int? totalReviews;
  int? isFavorite;
  String? type;

  Place({
    this.id,
    this.name,
    this.description,
    this.image,
    this.mapPhoto,
    this.governorateName,
    this.regionName,
    this.rate,
    this.totalReviews,
    this.isFavorite,
    this.type,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    mapPhoto: json['map_photo'] as String?,
    governorateName: json['governorate_name'] as String?,
    regionName: json['region_name'] as String?,
    rate: json['rate'] as String?,
    totalReviews: json['total_reviews'] as int?,
    isFavorite: json['is_favorite'] as int?,
    type: json['type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image,
    'map_photo': mapPhoto,
    'governorate_name': governorateName,
    'region_name': regionName,
    'rate': rate,
    'total_reviews': totalReviews,
    'is_favorite': isFavorite,
    'type': type,
  };
}

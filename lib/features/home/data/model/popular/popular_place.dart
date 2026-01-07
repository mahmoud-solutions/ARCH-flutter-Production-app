class PopularPlace {
  int? id;
  String? name;
  String? nameAr;
  String? nameEn;
  String? description;
  String? image;
  String? icon;
  int? order;
  int? ruinsCount;
  int? subPlacesCount;
  List<dynamic>? images;

  PopularPlace({
    this.id,
    this.name,
    this.nameAr,
    this.nameEn,
    this.description,
    this.image,
    this.icon,
    this.order,
    this.ruinsCount,
    this.subPlacesCount,
    this.images,
  });

  factory PopularPlace.fromJson(Map<String, dynamic> json) => PopularPlace(
    id: json['id'] as int?,
    name: json['name'] as String?,
    nameAr: json['name_ar'] as String?,
    nameEn: json['name_en'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    icon: json['icon'] as String?,
    order: json['order'] as int?,
    ruinsCount: json['ruins_count'] as int?,
    subPlacesCount: json['sub_places_count'] as int?,
    images: json['images'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'name_ar': nameAr,
    'name_en': nameEn,
    'description': description,
    'image': image,
    'icon': icon,
    'order': order,
    'ruins_count': ruinsCount,
    'sub_places_count': subPlacesCount,
    'images': images,
  };
}

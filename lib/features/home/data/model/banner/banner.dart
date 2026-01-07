class Bannner {
  int? id;
  String? image;
  String? link;
  int? order;
  bool? isActive;

  Bannner({this.id, this.image, this.link, this.order, this.isActive});

  factory Bannner.fromJson(Map<String, dynamic> json) => Bannner(
    id: json['id'] as int?,
    image: json['image'] as String?,
    link: json['link'] as String?,
    order: json['order'] as int?,
    isActive: json['is_active'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'link': link,
    'order': order,
    'is_active': isActive,
  };
}

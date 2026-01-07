class Sliderr {
  int? id;
  String? image;

  Sliderr({this.id, this.image});

  factory Sliderr.fromJson(Map<String, dynamic> json) =>
      Sliderr(id: json['id'] as int?, image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'image': image};
}

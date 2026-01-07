class Comment {
  int? id;
  String? description;
  int? ruinId;
  dynamic subPlaceId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Comment({
    this.id,
    this.description,
    this.ruinId,
    this.subPlaceId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json['id'] as int?,
    description: json['description'] as String?,
    ruinId: json['ruin_id'] as int?,
    subPlaceId: json['sub_place_id'] as dynamic,
    userId: json['user_id'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'ruin_id': ruinId,
    'sub_place_id': subPlaceId,
    'user_id': userId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

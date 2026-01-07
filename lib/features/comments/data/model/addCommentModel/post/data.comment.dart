import 'user.comment.dart';

class CommentModel {
  int? id;
  String? description;
  int? ruinId;
  dynamic subPlaceId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? images;
  User? user;

  CommentModel({
    this.id,
    this.description,
    this.ruinId,
    this.subPlaceId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
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
    images: json['images'] as List<dynamic>?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'ruin_id': ruinId,
    'sub_place_id': subPlaceId,
    'user_id': userId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'images': images,
    'user': user?.toJson(),
  };
}

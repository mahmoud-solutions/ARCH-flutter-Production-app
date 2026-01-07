import 'user.dart';

class GetComment {
  int? id;
  String? description;
  int? ruinId;
  dynamic subPlaceId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalLikes;
  int? totalDislikes;
  List<dynamic>? images;
  User? user;

  GetComment({
    this.id,
    this.description,
    this.ruinId,
    this.subPlaceId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.totalLikes,
    this.totalDislikes,
    this.images,
    this.user,
  });

  factory GetComment.fromJson(Map<String, dynamic> json) => GetComment(
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
    totalLikes: json['total_likes'] as int?,
    totalDislikes: json['total_dislikes'] as int?,
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
    'total_likes': totalLikes,
    'total_dislikes': totalDislikes,
    'images': images,
    'user': user?.toJson(),
  };
}

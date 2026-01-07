import 'comment.dart';

class LikeModel {
  int? commentId;
  int? userId;
  bool? isLike;
  int? totalLikes;
  int? totalDislikes;
  Comment? comment;

  LikeModel({
    this.commentId,
    this.userId,
    this.isLike,
    this.totalLikes,
    this.totalDislikes,
    this.comment,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
    commentId: json['comment_id'] as int?,
    userId: json['user_id'] as int?,
    isLike: json['is_like'] as bool?,
    totalLikes: json['total_likes'] as int?,
    totalDislikes: json['total_dislikes'] as int?,
    comment: json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'comment_id': commentId,
    'user_id': userId,
    'is_like': isLike,
    'total_likes': totalLikes,
    'total_dislikes': totalDislikes,
    'comment': comment?.toJson(),
  };
}

import 'dart:io';

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/comments/data/model/GetCommentModel/get_comment/get_comment_respose.dart';
import 'package:arch_team_power/features/comments/data/model/LikeeModellll/like_modell_response/like_modell_response.dart';
import 'package:arch_team_power/features/comments/data/model/addCommentModel/post/post.comment.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepo {
  Future<Either<Failure, Post>> addComment({
    required String description,
    File? image,
    required int ruinid,
  });

  Future<Either<Failure, GetCommentRespose>> getComments({required int ruinId});
  Future<Either<Failure, LikeModelRespnse>> likeComment({
    required int commentId,
    required bool isLike,
  });
}

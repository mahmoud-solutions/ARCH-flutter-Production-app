import 'dart:io';

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/comments/data/model/GetCommentModel/get_comment/get_comment_respose.dart';
import 'package:arch_team_power/features/comments/data/model/LikeeModellll/like_modell_response/like_modell_response.dart';
import 'package:arch_team_power/features/comments/data/model/addCommentModel/post/post.comment.dart';
import 'package:arch_team_power/features/comments/data/remote_data_source/commernts_remote_data_source.dart';
import 'package:arch_team_power/features/comments/domain/repo/commernt_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommerntRepoImpl implements CommentRepo {
  final CommentRemoteDataSource commentRemoteDataSource;
  CommerntRepoImpl(this.commentRemoteDataSource);

  @override
  Future<Either<Failure, Post>> addComment({
    required String description,
    File? image,
    required int ruinid,
  }) async {
    try {
      final comment = await commentRemoteDataSource.postComment(
        description: description,
        image: image,
        ruinid: ruinid,
      );
      return Right(comment);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCommentRespose>> getComments({
    required int ruinId,
  }) async {
    try {
      final response = await commentRemoteDataSource.getComments(
        ruinId: ruinId,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LikeModelRespnse>> likeComment({
    required int commentId,
    required bool isLike,
  }) async {
    try {
      final result = await commentRemoteDataSource.likeComment(
        commentId: commentId,
        isLike: isLike,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

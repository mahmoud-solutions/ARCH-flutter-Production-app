import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/comments/data/model/LikeeModellll/like_modell_response/like_modell_response.dart'
    show LikeModelRespnse;
import 'package:arch_team_power/features/comments/domain/repo/commernt_repo.dart';
import 'package:dartz/dartz.dart';

class LikeCommentUseCase {
  final CommentRepo repository;

  LikeCommentUseCase(this.repository);

  Future<Either<Failure, LikeModelRespnse>> call({
    required int commentId,
    required bool isLike,
  }) {
    return repository.likeComment(commentId: commentId, isLike: isLike);
  }
}

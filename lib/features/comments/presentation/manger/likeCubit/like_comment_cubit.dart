import 'package:arch_team_power/features/comments/domain/CommentUseCase/like_comment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'like_comment_state.dart';

class LikeCommentCubit extends Cubit<LikeCommentState> {
  final LikeCommentUseCase likeCommentUseCase;

  LikeCommentCubit(this.likeCommentUseCase) : super(LikeCommentInitial());

  Future<void> likeOrUnlikeComment({
    required int commentId,
    required bool isLike,
  }) async {
    emit(LikeCommentLoading());

    final result = await likeCommentUseCase(
      commentId: commentId,
      isLike: isLike,
    );

    result.fold(
      (failure) => emit(LikeCommentFailure(failure.message)),
      (response) => emit(LikeCommentSuccess(response)),
    );
  }
}

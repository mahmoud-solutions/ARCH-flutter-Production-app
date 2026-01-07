import 'dart:io';

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/comments/data/model/addCommentModel/post/data.comment.dart';
import 'package:arch_team_power/features/comments/data/model/addCommentModel/post/post.comment.dart';
import 'package:arch_team_power/features/comments/domain/repo/commernt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.commentRepo) : super(AddCommentInitial());

  final CommentRepo commentRepo;

  final List<CommentModel> _commentList = [];
  Future<void> addComment({
    required String description,
    File? image,
    required int ruinid,
  }) async {
    final Either<Failure, Post> result = await commentRepo.addComment(
      ruinid: ruinid,
      description: description,
      image: image,
    );

    result.fold(
      (failure) {
        emit(AddCommentFailure(errorMessage: failure.message));
      },
      (post) {
        if (post.data != null) {
          _commentList.insert(0, post.data!);
        }

        emit(AddCommentSuccess(commentModel: List.from(_commentList)));
      },
    );
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/comments/data/model/GetCommentModel/get_comment/get_comment_respose.dart';
import 'package:arch_team_power/features/comments/domain/repo/commernt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_comment_state.dart';

class GetCommentCubit extends Cubit<GetCommentState> {
  final CommentRepo commentRepo;
  GetCommentCubit(this.commentRepo) : super(GetCommentInitial());

  Future<void> getComments({required int ruinId}) async {
    final Either<Failure, GetCommentRespose> result = await commentRepo
        .getComments(ruinId: ruinId);
    result.fold(
      (failure) {
        emit(GetCommentError(message: failure.message));
      },
      (data) {
        emit(GetCommentSuccess(getCommentRespose: data));
      },
    );
  }
}

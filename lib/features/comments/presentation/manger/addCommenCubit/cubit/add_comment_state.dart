part of 'add_comment_cubit.dart';

@immutable
sealed class AddCommentState {}

final class AddCommentInitial extends AddCommentState {}

final class AddCommentLoading extends AddCommentState {}

final class AddCommentSuccess extends AddCommentState {
  final List<CommentModel> commentModel;
  AddCommentSuccess({required this.commentModel});
}

final class AddCommentFailure extends AddCommentState {
  final String errorMessage;
  AddCommentFailure({required this.errorMessage});
}

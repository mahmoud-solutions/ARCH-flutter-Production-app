part of 'get_comment_cubit.dart';

@immutable
sealed class GetCommentState {}

final class GetCommentInitial extends GetCommentState {}

final class GetCommentLoading extends GetCommentState {}

final class GetCommentError extends GetCommentState {
  final String message;
  GetCommentError({required this.message});
}

final class GetCommentSuccess extends GetCommentState {
  final GetCommentRespose getCommentRespose;
  GetCommentSuccess({required this.getCommentRespose});
}

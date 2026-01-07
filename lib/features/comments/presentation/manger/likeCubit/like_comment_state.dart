import 'package:arch_team_power/features/comments/data/model/LikeeModellll/like_modell_response/like_modell_response.dart';
import 'package:equatable/equatable.dart';

abstract class LikeCommentState extends Equatable {
  const LikeCommentState();

  @override
  List<Object?> get props => [];
}

class LikeCommentInitial extends LikeCommentState {}

class LikeCommentLoading extends LikeCommentState {}

class LikeCommentSuccess extends LikeCommentState {
  final LikeModelRespnse response;

  const LikeCommentSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class LikeCommentFailure extends LikeCommentState {
  final String message;

  const LikeCommentFailure(this.message);

  @override
  List<Object?> get props => [message];
}

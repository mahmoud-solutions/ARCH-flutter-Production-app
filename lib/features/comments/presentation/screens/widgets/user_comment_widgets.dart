import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/comments/presentation/manger/likeCubit/like_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/manger/likeCubit/like_comment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildMessage(
  BuildContext context, {
  required String name,
  required String role,
  required String description,
  required String imageUser,
  required String imageComment,
  required int commentId,
  required int totalLikes,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(17),
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المستخدم والاسم والدور
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: imageUser.isNotEmpty
                    ? AssetImage(imageUser)
                    : null,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.syleNorsalMedium12(context)),
                  Text(
                    role,
                    style: AppTextStyles.syleNorsalRegular10(context).copyWith(
                      color: const Color(0xFF8A8A8A),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // نص التعليق
          Text(
            description,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),

          const SizedBox(height: 10),

          // صورة التعليق لو موجودة
          if (imageComment.isNotEmpty)
            SizedBox(
              width: 116,
              height: 88,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageComment,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 116,
                      height: 88,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),

          const SizedBox(height: 10),

          // زرار اللايك والديسلايك مع العدد
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<LikeCommentCubit>().likeOrUnlikeComment(
                      commentId: commentId,
                      isLike: true,
                    );
                  },
                  child: BlocBuilder<LikeCommentCubit, LikeCommentState>(
                    builder: (context, state) {
                      bool isLiked = false;
                      int likesCount = totalLikes;

                      if (state is LikeCommentSuccess &&
                          state.response.data?.commentId == commentId) {
                        isLiked = state.response.data?.isLike ?? false;
                        likesCount =
                            state.response.data?.totalLikes ?? totalLikes;
                      }

                      return Row(
                        children: [
                          Image.asset(
                            isLiked ? AppIcons.kLikeIcon : AppIcons.kLike2Icon,
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(likesCount.toString()),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(width: 16),

                Image.asset(AppIcons.kDisLikeIcon, width: 18, height: 18),
                const SizedBox(width: 4),
                const Text('0'), // ديسلايك لو حابب تحدثه بعدين
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

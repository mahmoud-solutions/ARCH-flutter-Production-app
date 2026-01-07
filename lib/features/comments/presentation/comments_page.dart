import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/comments/presentation/manger/GetCommentCubit/cubit/get_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/manger/addCommenCubit/cubit/add_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/manger/likeCubit/like_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/screens/widgets/build_write_messege.dart';
import 'package:arch_team_power/features/comments/presentation/screens/widgets/user_comment_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage({super.key});
  final PageController controller = PageController(initialPage: 0);
  final ruinId = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<AddCommentCubit>()),
          BlocProvider(
            create: (_) => sl<GetCommentCubit>()..getComments(ruinId: ruinId),
          ),
          BlocProvider(create: (_) => sl<LikeCommentCubit>()),
        ],
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.86.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 34.h),
                    const CustomAppBar(title: 'التعليقات'),
                    SizedBox(height: 34.h),
                    BlocListener<AddCommentCubit, AddCommentState>(
                      listener: (context, state) {
                        if (state is AddCommentSuccess) {
                          context.read<GetCommentCubit>().getComments(
                            ruinId: ruinId,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم اضافة التعليق بنجاح'),
                            ),
                          );
                        } else if (state is AddCommentFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        }
                      },
                      child: BlocBuilder<GetCommentCubit, GetCommentState>(
                        builder: (context, state) {
                          if (state is GetCommentSuccess) {
                            final comments = state.getCommentRespose.data ?? [];

                            return ListView.builder(
                              itemCount: comments.length,

                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(16.0),
                              itemBuilder: (BuildContext context, int index) {
                                final comment = comments[index];

                                return buildMessage(
                                  commentId: comment.id!,
                                  context,
                                  name: comment.user?.name ?? 'مجهول',
                                  role: comment.user?.role ?? '',
                                  description: comment.description ?? '',
                                  imageUser: comment.user?.image ?? '',
                                  imageComment:
                                      (comment.images != null &&
                                          comment.images!.isNotEmpty)
                                      ? comment.images!.first
                                      : '',
                                  totalLikes: comment.totalLikes ?? 0,
                                );
                              },
                            );
                          } else if (state is GetCommentLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetCommentError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const Center(
                              child: Text('لا توجد تعليقات حتى الآن'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const WriteMessageAndSend(),
          ),
        ),
      ),
    );
  }
}

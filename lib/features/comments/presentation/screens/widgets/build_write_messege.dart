import 'dart:io';

import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/comments/presentation/manger/addCommenCubit/cubit/add_comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class WriteMessageAndSend extends StatelessWidget {
  const WriteMessageAndSend({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    File? selectedImage;
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage() async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = File(image.path);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: Container(
                  width: 16,
                  height: 14,
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: pickImage,
                    child: SvgPicture.asset("assets/image/image.svg"),
                  ),
                ),
                hintText: "اكتب تعليق...",
                hintStyle: AppTextStyles.syleNorsalRegular10(
                  context,
                ).copyWith(color: const Color(0xFFD0D0D0)),
                filled: true,
                fillColor: AppColors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.favorite,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              final description = _controller.text.trim();

              if (description.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('من فضلك اكتب تعليق الأول')),
                );
              } else {
                const int ruinId = 1;
                context.read<AddCommentCubit>().addComment(
                  description: description,
                  image: selectedImage,
                  ruinid: ruinId,
                );
                _controller.clear();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.favorite),
              ),
              child: Image.asset(
                AppIcons.kSendMessageIcon,
                width: 22,
                height: 22,
                color: AppColors.favorite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_text_fiald.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteDialogDetails extends StatelessWidget {
  const NoteDialogDetails({
    super.key,
    required this.titleController,
    required this.setDialogState,
    required this.detailsController,
  });

  final TextEditingController titleController, detailsController;
  final Function(void Function()) setDialogState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('إضافة ملاحظة', style: AppTextStyles.syleNorsalMedium14(context)),
        SizedBox(height: 20.h),

        NotesTextField(
          hintText: 'العنوان',
          maxLines: 2,
          controller: titleController,
          width: 190.w,
          height: 40.h,
        ),

        SizedBox(height: 10.h),
        NotesTextField(
          hintText: 'الوصف',
          maxLines: 7,
          controller: detailsController,
          width: 190.w,
          height: 80.h,
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}

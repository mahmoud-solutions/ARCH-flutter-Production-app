import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        width: 298.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteEntity.title,
                    style: AppTextStyles.syleNorsalMedium13(
                      context,
                    ).copyWith(color: const Color(0xFF282828)),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    noteEntity.description,
                    style: AppTextStyles.syleNorsalRegular12(
                      context,
                    ).copyWith(color: const Color(0xFF8A8A8A)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              NoteActions(note: noteEntity),
            ],
          ),
        ),
      ),
    );
  }
}

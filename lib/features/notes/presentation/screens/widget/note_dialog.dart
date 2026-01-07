import 'package:arch_team_power/features/notes/presentation/screens/widget/note_actions_item.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_dialog_details.dart';
import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  const NoteDialog({
    super.key,
    required this.titleController,
    required this.detailsController,
    required this.onSave,
  });
  final TextEditingController titleController;
  final TextEditingController detailsController;
  final VoidCallback onSave;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setDialogState) => AlertDialog(
        backgroundColor: const Color(0xffF6F6F6),

        contentPadding: const EdgeInsets.all(16),
        content: NoteDialogDetails(
          detailsController: detailsController,
          setDialogState: setDialogState,
          titleController: titleController,
        ),

        actions: [
          NotesActionItem(
            title: 'تأكيد',
            color: const Color(0xFF4B5320),
            onTap: onSave,
          ),
          NotesActionItem(
            title: 'إلغاء',
            color: const Color(0xFFD2B48C),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

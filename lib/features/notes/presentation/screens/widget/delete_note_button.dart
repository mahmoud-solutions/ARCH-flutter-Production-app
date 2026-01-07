import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_actions_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({super.key, required this.note});
  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return NotesActionItem(
      color: const Color(0xFFD2B48C),
      title: 'حذف ',
      onTap: () => context.read<DeleteNoteCubit>().deleteNote(id: note.id),
    );
  }
}

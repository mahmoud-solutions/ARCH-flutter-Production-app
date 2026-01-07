import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/delete_note_button_bloc_listener.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/edit_button_bloc_listener.dart';
import 'package:flutter/material.dart';

class NoteActions extends StatelessWidget {
  const NoteActions({super.key, required this.note});
  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EditButtonBlocListener(note: note),
        const SizedBox(width: 8),
        DeleteNoteButtonBlocListener(note: note),
      ],
    );
  }
}

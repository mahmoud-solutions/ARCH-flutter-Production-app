import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/edit_notes_cubit/edit_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_actions_item.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditButton extends StatefulWidget {
  const EditButton({super.key, required this.note});
  final NoteEntity note;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  late final TextEditingController titleController;
  late final TextEditingController detailsController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    detailsController = TextEditingController(text: widget.note.description);
  }

  void openNoteDialog() {
    final editCubit = context.read<EditNotesCubit>();

    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: editCubit,
        child: NoteDialog(
          titleController: titleController,
          detailsController: detailsController,
          onSave: () {
            editCubit.editNote(
              id: widget.note.id,
              title: titleController.text,
              description: detailsController.text,
            );

            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotesActionItem(
      color: const Color.fromARGB(255, 19, 20, 14),
      title: 'تعديل',
      onTap: openNoteDialog,
    );
  }
}

import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/create_note_cubit/create_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openAddNoteDialog(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final editCubit = context.read<CreateNoteCubit>();
  showDialog(
    context: context,
    builder: (context) => BlocProvider.value(
      value: editCubit,
      child: NoteDialog(
        titleController: titleController,
        detailsController: detailsController,

        onSave: () {
          editCubit.createNote(
            title: titleController.text,
            description: detailsController.text,
          );
          titleController.clear();
          detailsController.clear();
          Navigator.pop(context);
        },
      ),
    ),
  );
}

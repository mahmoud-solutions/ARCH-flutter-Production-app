import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/edit_notes_cubit/edit_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/edit_note_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditButtonBlocListener extends StatelessWidget {
  const EditButtonBlocListener({super.key, required this.note});

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditNotesCubit, EditNotesState>(
      listener: (context, state) {
        if (state is EditNotesSuccess) {
          context.read<GetNotesCubit>().getNotes();
        } else if (state is EditNotesFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      child: EditButton(note: note),
    );
  }
}

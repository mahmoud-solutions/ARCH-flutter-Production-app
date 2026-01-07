import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/delete_note_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteNoteButtonBlocListener extends StatelessWidget {
  const DeleteNoteButtonBlocListener({super.key, required this.note});

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          context.read<GetNotesCubit>().getNotes();
        } else if (state is DeleteNoteFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      child: DeleteNoteButton(note: note),
    );
  }
}

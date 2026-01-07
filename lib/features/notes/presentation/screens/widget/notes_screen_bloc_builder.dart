import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/add_note_float_action_button.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/empty_notes_widget.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreenBlocBuilder extends StatelessWidget {
  const NotesScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesEmpty) {
          return const Expanded(
            child: Column(
              children: [
                Expanded(child: EmptyNotesWidget()),

                AddNoteFloatActionButton(),
              ],
            ),
          );
        } else if (state is GetNotesSuccess) {
          return Expanded(
            child: Column(
              children: [
                Expanded(child: NotesListView(noteEntity: state.notes)),
                const AddNoteFloatActionButton(),
              ],
            ),
          );
        } else if (state is GetNotesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}

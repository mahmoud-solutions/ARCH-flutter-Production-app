import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/edit_notes_cubit/edit_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.noteEntity});
  final List<NoteEntity> noteEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<DeleteNoteCubit>()),
        BlocProvider(create: (context) => sl<EditNotesCubit>()),
      ],
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: noteEntity.length,
        itemBuilder: (context, index) =>
            NoteItem(noteEntity: noteEntity[index]),
      ),
    );
  }
}

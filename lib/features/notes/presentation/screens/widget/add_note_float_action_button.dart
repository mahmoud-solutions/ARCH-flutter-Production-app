import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/create_note_cubit/create_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/widget/add_note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteFloatActionButton extends StatelessWidget {
  const AddNoteFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNoteCubit, CreateNoteState>(
      listener: (context, state) {
        if (state is CreateNoteSuccess) {
          context.read<GetNotesCubit>().getNotes();
        } else if (state is CreateNoteFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      child: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => openAddNoteDialog(context),
        child: Icon(Icons.add, size: 30.sp, color: Colors.white),
      ),
    );
  }
}

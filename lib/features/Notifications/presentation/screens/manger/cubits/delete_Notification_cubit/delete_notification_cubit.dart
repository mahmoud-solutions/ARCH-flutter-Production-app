import 'package:arch_team_power/features/Notifications/domain/Notidication_Usecase/delete_all_notification%20usecase.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/delete_Notification_cubit/delete_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAllNotificationsCubit extends Cubit<DeleteAllNotificationsState> {
  final DeleteAllNotificationsUseCase useCase;

  DeleteAllNotificationsCubit(this.useCase)
    : super(DeleteAllNotificationsInitial());

  Future<void> deleteAll() async {
    emit(DeleteAllNotificationsLoading());

    final result = await useCase();

    result.fold(
      (failure) => emit(DeleteAllNotificationsFailure(failure.message)),
      (response) => emit(DeleteAllNotificationsSuccess(response)),
    );
  }
}

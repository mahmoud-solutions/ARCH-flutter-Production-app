import 'package:arch_team_power/features/Notifications/domain/Notidication_Usecase/get_unread_count_usecase.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/unread_notification_count_cubit/unread_count_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnreadNotificationsCountCubit
    extends Cubit<UnreadNotificationsCountState> {
  final GetUnreadNotificationsCountUseCase useCase;

  UnreadNotificationsCountCubit(this.useCase)
    : super(UnreadNotificationsCountInitial());

  Future<void> getUnreadCount() async {
    emit(UnreadNotificationsCountLoading());

    final result = await useCase();

    result.fold(
      (failure) => emit(UnreadNotificationsCountFailure(failure.message)),
      (count) => emit(UnreadNotificationsCountSuccess(count)),
    );
  }
}

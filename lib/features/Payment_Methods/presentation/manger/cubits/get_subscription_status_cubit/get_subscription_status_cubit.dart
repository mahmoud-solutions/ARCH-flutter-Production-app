import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_status_sntity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/get_subscription_status_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_subscription_status_state.dart';

class GetSubscriptionStatusCubit extends Cubit<GetSubscriptionStatusState> {
  GetSubscriptionStatusCubit(this.getSubscriptionStatusUseCase)
    : super(GetSubscriptionStatusInitial());
  final GetSubscriptionStatusUseCase getSubscriptionStatusUseCase;
  Future<void> getSubscriptionStatus() async {
    emit(GetSubscriptionStatusLoading());
    final result = await getSubscriptionStatusUseCase();
    result.fold(
      (failure) =>
          emit(GetSubscriptionStatusFailure(errorMessage: failure.message)),
      (data) =>
          emit(GetSubscriptionStatusSuccess(subscriptionStatusEntity: data)),
    );
  }
}

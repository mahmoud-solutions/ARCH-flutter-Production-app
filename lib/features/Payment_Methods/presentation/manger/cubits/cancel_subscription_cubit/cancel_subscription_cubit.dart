import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/cancel_subscription_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_subscription_state.dart';

class CancelSubscriptionCubit extends Cubit<CancelSubscriptionState> {
  CancelSubscriptionCubit(this.cancelSubscriptionUseCase)
    : super(CancelSubscriptionInitial());
  final CancelSubscriptionUseCase cancelSubscriptionUseCase;
  Future<void> cancelSubscription() async {
    emit(CancelSubscriptionLoading());
    final response = await cancelSubscriptionUseCase();
    response.fold(
      (failure) =>
          emit(CancelSubscriptionFailure(errorMessage: failure.message)),
      (success) => emit(CancelSubscriptionSuccess()),
    );
  }
}

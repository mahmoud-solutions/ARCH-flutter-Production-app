import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/get_subscription_plans_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_subscription_plans_state.dart';

class GetSubscriptionPlansCubit extends Cubit<GetSubscriptionPlansState> {
  GetSubscriptionPlansCubit(this.getSubscriptionPlansUseCase)
    : super(GetSubscriptionPlansInitial());
  final GetSubscriptionPlansUseCase getSubscriptionPlansUseCase;

  Future<void> getSubscriptionPlans() async {
    emit(GetSubscriptionPlansLoading());
    final response = await getSubscriptionPlansUseCase();
    response.fold(
      (failure) =>
          emit(GetSubscriptionPlansFailure(errorMessage: failure.message)),
      (subscriptionPlans) => emit(
        GetSubscriptionPlansSuccess(getSubscriptionPlans: subscriptionPlans),
      ),
    );
  }
}

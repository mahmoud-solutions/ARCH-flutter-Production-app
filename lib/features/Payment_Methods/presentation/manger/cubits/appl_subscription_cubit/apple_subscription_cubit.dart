import 'package:arch_team_power/features/Payment_Methods/domain/entity/apple_subscription_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/apple_subscription_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'apple_subscription_state.dart';

class AppleSubscriptionCubit extends Cubit<AppleSubscriptionState> {
  AppleSubscriptionCubit(this.appleSubscriptionUseCase)
    : super(AppleSubscriptionInitial());
  final AppleSubscriptionUseCase appleSubscriptionUseCase;
  Future<void> appleSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    emit(AppleSubscriptionLoading());
    final response = await appleSubscriptionUseCase(
      productId: productId,
      purchaseToken: purchaseToken,
    );
    response.fold(
      (failure) =>
          emit(AppleSubscriptionFailure(errorMessage: failure.message)),
      (success) =>
          emit(AppleSubscriptionSuccess(appleSubscriptionEntity: success)),
    );
  }
}

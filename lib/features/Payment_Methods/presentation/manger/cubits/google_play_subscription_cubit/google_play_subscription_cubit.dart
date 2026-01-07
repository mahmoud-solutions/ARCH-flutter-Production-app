import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_details_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/google_play_activate_subscription_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'google_play_subscription_state.dart';

class GooglePlaySubscriptionCubit extends Cubit<GooglePlaySubscriptionState> {
  GooglePlaySubscriptionCubit(this.googlePlayActivateSubscriptionUseCase)
    : super(GooglePlaySubscriptionInitial());
  final GooglePlayActivateSubscriptionUseCase
  googlePlayActivateSubscriptionUseCase;
  Future<void> getGooglePlayActivateSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    emit(GooglePlaySubscriptionLoading());

    final result = await googlePlayActivateSubscriptionUseCase(
      productId: productId,
      purchaseToken: purchaseToken,
    );

    result.fold(
      (failure) =>
          emit(GooglePlaySubscriptionFaliure(errorMessage: failure.message)),
      (data) => emit(
        GooglePlaySubscriptionSuccess(
          googlePalyActivateSubscriptionEntity: data,
        ),
      ),
    );
  }
}

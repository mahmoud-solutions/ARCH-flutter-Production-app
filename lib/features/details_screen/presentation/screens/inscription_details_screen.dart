import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/inscription_details_screen_body.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/Inscriptions_details_cubit/inscriptions_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InscriptionDetailsScreen extends StatelessWidget {
  const InscriptionDetailsScreen({super.key, required this.inscriptionsEntity});
  final InscriptionsEntity inscriptionsEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f8f8),
      body: BlocProvider(
        create: (context) =>
            sl<InscriptionsDetailsCubit>()
              ..getInscriptionsDetails(id: inscriptionsEntity.id),
        child: SafeArea(
          child: InscriptionDetailsScreenBody(
            inscriptionsEntity: inscriptionsEntity,
          ),
        ),
      ),
    );
  }
}

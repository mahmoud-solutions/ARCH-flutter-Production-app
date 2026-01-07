import 'package:arch_team_power/features/details_screen/presentation/screens/widget/dot_indctor.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';

class InscriptionDotIdctorList extends StatelessWidget {
  const InscriptionDotIdctorList({
    super.key,
    required this.cruntPageIndex,
    required this.inscriptionsEntity,
  });

  final int cruntPageIndex;
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(inscriptionsEntity.images.length, (index) {
        return CustomDotIndicator(isActive: index == cruntPageIndex);
      }),
    );
  }
}

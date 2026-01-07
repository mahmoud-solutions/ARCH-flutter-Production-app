import 'package:arch_team_power/features/details_screen/presentation/screens/widget/inscription_details_screen_body_info.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/inscription_details_screen_page_view_and_header.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';

class InscriptionDetailsScreenBody extends StatelessWidget {
  const InscriptionDetailsScreenBody({
    super.key,
    required this.inscriptionsEntity,
  });
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InscriptionDetailsScreenPageViewAndHeader(
            inscriptionsEntity: inscriptionsEntity,
          ),
          InscriptionDetailsScreenBodyInfo(
            inscriptionsEntity: inscriptionsEntity,
          ),
        ],
      ),
    );
  }
}

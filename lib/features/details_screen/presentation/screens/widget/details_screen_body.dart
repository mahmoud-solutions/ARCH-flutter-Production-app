import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_body_info.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_page_view_and_header.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsScreenPageViewAndHeader(subPlaceEntity: subPlaceEntity),
          DetailsScreenBodyInfo(subPlaceEntity: subPlaceEntity),
        ],
      ),
    );
  }
}

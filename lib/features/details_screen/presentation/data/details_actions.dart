import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_body_info_actions_item.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/rate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<Widget> actions = [
  const MessageAction(),
  const DetailsScreenBodyInfoActionsItem(
    icon: 'assets/icons/location_icon.svg',
    title: '4.5 km',
  ),
  const RateAction(),

  const DetailsScreenBodyInfoActionsItem(
    icon: 'assets/icons/vr_icon.svg',
    title: 'VR',
  ),
  const DetailsScreenBodyInfoActionsItem(
    icon: 'assets/icons/voice_icon.svg',
    title: 'VO',
  ),
];

class MessageAction extends StatelessWidget {
  const MessageAction({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsScreenBodyInfoActionsItem(
      onTap: () => GoRouter.of(context).push(AppRouter.kComments),
      icon: 'assets/icons/message_icon.svg',
      title: '45',
    );
  }
}

class RateAction extends StatelessWidget {
  const RateAction({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => const RateDialog());
      },
      child: const DetailsScreenBodyInfoActionsItem(
        icon: 'assets/icons/star_icon.svg',
        title: '4.5',
      ),
    );
  }
}

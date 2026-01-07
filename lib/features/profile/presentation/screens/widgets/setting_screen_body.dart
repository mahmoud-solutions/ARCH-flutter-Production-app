import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/settings_items.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/log_out_cubit/log_out_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/custom_log_out_show_model_bottom_shett_details.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/settings_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const CustomAppBar(title: 'الاعدادات'),
          SizedBox(height: 34.h),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SettingsItemsData.items(context).length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return SettingsItemTile(
                onTap: () {
                  if (index == 0) {
                    GoRouter.of(context).push(AppRouter.kUpdateProfileScreen);
                  } else if (index == 2) {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kSubscriptionPlansScreen);
                  } else if (index == 5) {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) => sl<LogOutCubit>(),
                        child: const CustomLogOutShowModelBottomShettDetails(),
                      ),
                    );
                  }
                },
                item: SettingsItemsData.items(context)[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

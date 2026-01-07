import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/camera/presentation/screens/camera_screen.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/screens/favorite_screen.dart';
import 'package:arch_team_power/features/home/presentation/screens/home_sceen.dart';
import 'package:arch_team_power/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../maps_screen/presentation/screens/map_screen.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const MapScreen(),
    const CameraScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: selectedIndex == 2
          ? null
          : BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              backgroundColor: Colors.white,
              unselectedItemColor: AppColors.unSelectItemSelectedColor,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              fixedColor: AppColors.unSelectItemSelectedColor,
              selectedLabelStyle: AppTextStyles.syleNorsalRegular10(
                context,
              ).copyWith(color: AppColors.primary),
              items: [
                customBtnItem(
                  image: selectedIndex == 0
                      ? AppIcons.kHomeIcon
                      : AppIcons.kUnAciveHomeIcon,
                  label: "الرئيسية",
                ),
                customBtnItem(
                  image: selectedIndex == 1
                      ? AppIcons.kActiveLocationIcon
                      : AppIcons.kLocatMarkerIcon,
                  label: "الموقع",
                ),
                customBtnItem(image: AppIcons.kCameraIcon, label: "الكاميرا"),
                customBtnItem(
                  image: selectedIndex == 3
                      ? AppIcons.kActiveFavIcon
                      : AppIcons.kFavIcon,
                  label: "المفضله",
                ),
                customBtnItem(
                  image: selectedIndex == 4
                      ? AppIcons.kActiveProfileIcon
                      : AppIcons.kPrsonalIcon,
                  label: "الملف الشخصي",
                ),
              ],
            ),
      body: screens[selectedIndex],
    );
  }

  BottomNavigationBarItem customBtnItem({
    required String image,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(image),

      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(height: 6),

          SvgPicture.asset(
            image,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
      label: label,
    );
  }
}

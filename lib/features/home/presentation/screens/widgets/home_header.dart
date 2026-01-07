import 'dart:async';

import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/widgets/profile_header.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/slider_cubit/slider_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'search_box.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // المؤقت لتغيير الصفحة كل 3 ثواني
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      final sliderCubit = context.read<SliderCubitCubit>();
      if (sliderCubit.state is SliderCubitLoaded) {
        final sliders = (sliderCubit.state as SliderCubitLoaded).sliders;
        if (sliders.isNotEmpty && _pageController.hasClients) {
          _currentPage = (_currentPage + 1) % sliders.length;
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubitCubit, SliderCubitState>(
      builder: (context, state) {
        if (state is SliderCubitLoaded) {
          final sliders = state.sliders;

          return SizedBox(
            height: 240.h,
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: sliders.length,
                  itemBuilder: (context, index) {
                    final slider = sliders[index];
                    final imageUrl = slider.image ?? '';

                    return CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300.h,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[300]),
                      errorWidget: (context, url, error) =>
                          Container(color: Colors.grey[300]),
                    );
                  },
                ),

                /// Gradient Overlay
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),

                /// Top Bar
                Positioned(
                  top: 20.h,
                  left: 15.w,
                  right: 15.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ProfileHeader(
                        nameColor: Colors.white,
                        roleColor: Colors.white,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => GoRouter.of(
                              context,
                            ).push(AppRouter.kNotesScreen),
                            child: SvgPicture.asset(
                              'assets/icons/note_edit_icon.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              height: 23.h,
                              width: 23.w,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => GoRouter.of(
                              context,
                            ).push(AppRouter.kNotificationsPage),
                            child: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Search Box
                Positioned(
                  bottom: 60.h,
                  left: 20.w,
                  right: 20.w,
                  child: const SearchBox(),
                ),
              ],
            ),
          );
        } else if (state is SliderCubitError) {
          return const SizedBox(
            height: 300,
            child: Center(child: Text("error")),
          );
        } else {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

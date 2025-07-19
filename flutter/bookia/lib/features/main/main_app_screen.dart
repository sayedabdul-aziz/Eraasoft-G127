import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/cart/presentation/page/cart_screen.dart';
import 'package:bookia/features/home/presentation/page/home_screen.dart';
import 'package:bookia/features/profile/presentation/page/profile_screen.dart';
import 'package:bookia/features/wishlist/presentation/page/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.borderColor)),
          color: AppColors.whiteColor,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppAssets.homeSvg,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(AppAssets.homeSvg),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppAssets.bookmarkSvg,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(AppAssets.bookmarkSvg),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppAssets.categorySvg,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(AppAssets.categorySvg),
              label: 'Cart',
            ),

            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppAssets.profileSvg,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(AppAssets.profileSvg),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

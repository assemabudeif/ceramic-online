import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_app_bar.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/global/language/app_strings.dart';
import 'home_view.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  final int _indexCount = 4;
  final List<Widget> _screens = [
    Container(),
    Container(),
    const HomeView(),
    Container(),
    Container(),
  ];

  int _currentIndex = 2;
  int _navIndex = -1;
  List<String> titles = [
    AppStrings.favorites.tr,
    AppStrings.categories.tr,
    AppStrings.orders.tr,
    AppStrings.profile.tr,
  ];

  List<IconData> icons = [
    Icons.favorite,
    Icons.category,
    Icons.list_alt_outlined,
    Icons.person,
  ];

  _changeIndex(int index) {
    setState(() {
      if (index == 2) {
        _navIndex = -1;
      } else if (index < 2) {
        _navIndex = index;
      } else {
        _navIndex = index - 1;
      }
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        haveBackIcon: false,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: kDefaultPadding.w),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AssetsData.cartIconSVG,
              ),
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          _changeIndex(2);
        },
        backgroundColor: _currentIndex == 2 ? kPrimaryColor : kHintColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              const Icon(Icons.home_outlined),
              Text(
                AppStrings.home.tr,
                style: context.textTheme.bodySmall!.copyWith(
                    color: kWhiteColor, fontWeight: kFontWeightSemiBold,),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          activeIndex: _navIndex,
          onTap: (index) {
            if (index < 2) {
              _changeIndex(index);
            } else {
              _changeIndex(index + 1);
            }
          },
          itemCount: _indexCount,
          gapLocation: GapLocation.center,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  size: 24.sp,
                  color: isActive ? kPrimaryColor : kHintColor,
                ),
                const SizedBox(height: 4),
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isActive ? kPrimaryColor : kHintColor,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

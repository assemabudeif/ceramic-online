import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '/features/order/presentation/views/orders_view.dart';
import '/features/profile/presentation/views/profile_view.dart';
import '/features/favorites/presentation/views/favorite_view.dart';
import '../../../widgets/chat_with_support_widget.dart';
import '../../../categories/presentation/views/categories_view.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_app_bar.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import 'home_view.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static void changeIndex({required BuildContext context, required int index}) {
    var state = context.findAncestorStateOfType<_HomeLayoutViewState>();
    state?.setState(() {
      // state._currentIndex = index;
      // state._navIndex = 0;
      state.changeIndex(index);
    });
  }

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  final int _indexCount = 4;
  final List<Widget> _screens = [
    const FavoriteView(),
    const CategoriesView(),
    const HomeView(),
    const OrdersView(),
    const ProfileView(),
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

  changeIndex(int index) {
    log(index.toString());
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
        haveBackIcon: _currentIndex != 2,
        onBack: () {
          changeIndex(2);
        },
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
      body: ChatWithSupportWidget(
        child: _screens[_currentIndex],
      ),
      floatingActionButton: FloatingActionButton(
        mini: false,
        shape: const CircleBorder(),
        onPressed: () {
          changeIndex(2);
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
                  color: kWhiteColor,
                  fontWeight: kFontWeightSemiBold,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 0.08.sh,
          activeIndex: _navIndex,
          onTap: (index) {
            if (index < 2) {
              changeIndex(index);
            } else {
              changeIndex(index + 1);
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
                  size: 22.r,
                  color: isActive ? kPrimaryColor : kHintColor,
                ),
                const SizedBox(height: 4),
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: isActive ? kPrimaryColor : kHintColor,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

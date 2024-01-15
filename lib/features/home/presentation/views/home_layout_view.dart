import '/core/global/language/language_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_layout_imports.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static void changeIndex({required BuildContext context, required int index}) {
    var state = context.findAncestorStateOfType<_HomeLayoutViewState>();

    state?.changeIndex(index);
    state?.refresh();
  }

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  final int _indexCount = 4;
  refresh() => setState(() {});

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
          Visibility(
            visible: _currentIndex == 4,
            child: TextButton(
              onPressed: () {
                changeAppLanguage(context);
              },
              child: Text(
                AppStrings.changeLanguage.tr,
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: kFontWeightSemiBold,
                  decoration: TextDecoration.underline,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: kDefaultPadding.w),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.cartPath);
              },
              child: Stack(
                children: [
                  SvgPicture.asset(
                    AssetsData.cartIconSVG,
                    matchTextDirection: true,
                    width: 23.w,
                  ),
                  PositionedDirectional(
                    top: 0,
                    end: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: context.textTheme.bodySmall!.copyWith(
                            color: kWhiteColor,
                            fontWeight: kFontWeightSemiBold,
                            fontSize: 7.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (_currentIndex != 2) {
            changeIndex(2);
          } else {
            _showAlterDialog(context);
          }
        },
        child: ChatWithSupportWidget(
          child: _screens[_currentIndex],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50.w,
        height: 50.w,
        child: FloatingActionButton(
          mini: false,
          shape: const CircleBorder(),
          onPressed: () {
            changeIndex(2);
          },
          backgroundColor: _currentIndex == 2 ? kPrimaryColor : kHintColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 20.sp,
                ),
                Text(
                  AppStrings.home.tr,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: kWhiteColor,
                    fontWeight: kFontWeightBold,
                    fontSize: getAppLanguageCode == 'en' ? 12.sp : 10.sp,
                  ),
                ),
                const Spacer(),
              ],
            ),
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

  void _showAlterDialog(BuildContext context) {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.warning,
        title: AppStrings.exit.tr,
        text: AppStrings.areYouSureToExitApp.tr,
        showCancelBtn: true,
        confirmButtonText: AppStrings.exit.tr,
        cancelButtonText: AppStrings.cancel.tr,
        onCancel: () {
          Get.back();
        },
        onConfirm: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else {
            exit(0);
          }
        },
      ),
    );
  }
}

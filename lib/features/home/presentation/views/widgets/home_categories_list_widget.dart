import '/core/utilities/dummy.dart';
import '/core/utilities/routes_manger.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class HomeCategoriesListWidget extends StatefulWidget {
  const HomeCategoriesListWidget({super.key});

  @override
  State<HomeCategoriesListWidget> createState() =>
      _HomeCategoriesListWidgetState();
}

class _HomeCategoriesListWidgetState extends State<HomeCategoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: kDummyCategories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.categoryDataPath);
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kTextFieldFillColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: 60.w,
                  height: 60.h,
                  child: Center(
                    child: SvgPicture.asset(
                      kDummyCategories[index].image,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(kDummyCategories[index].name),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
      ),
    );
  }
}

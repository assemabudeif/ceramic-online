import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/routes_manger.dart';
import '/features/home/presentation/views/widgets/home_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppStrings.chooseCategories.tr,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          HomeSearchWidget(
            hintText: AppStrings.search.tr,
            hasPadding: false,
          ),
          const SizedBox(height: kDefaultPadding),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.categoryDataPath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                              width: 30.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          kDummyCategories[index].name,
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: kDefaultPadding);
            },
            itemCount: kDummyCategories.length,
          ),
        ],
      ),
    );
  }
}

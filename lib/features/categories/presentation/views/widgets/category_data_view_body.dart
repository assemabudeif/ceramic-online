import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoryDataViewBody extends StatelessWidget {
  const CategoryDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Shop',
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.productDetailsPath);
                },
                child: Container(
                  width: 1.sw,
                  height: 0.37.sh,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding.w,
                    vertical: kDefaultPadding.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: SvgPicture.asset(
                            kDummyProducts[index].image,
                            // width: 1.sw,
                            fit: BoxFit.cover,
                            // height: 0.3.sw,
                          ),
                        ),
                      ),
                      Text(
                        kDummyProducts[index].name,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: kTextDarkColor,
                        ),
                      ),
                      Text(
                        kDummyProducts[index].description,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: kTextColor,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'EGP',
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: kTextDarkColor,
                            ),
                          ),
                          SizedBox(width: kDefaultPadding.w / 3),
                          Text(
                            kDummyProducts[index].price,
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: kTextDarkColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: kDefaultPadding.h,
            ),
            itemCount: kDummyProducts.length,
          ),
        ],
      ),
    );
  }
}

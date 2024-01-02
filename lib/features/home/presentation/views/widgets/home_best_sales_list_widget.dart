import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBestSalesListWidget extends StatelessWidget {
  const HomeBestSalesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.16.sh,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 0.3.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: kWhiteColor,
            ),
            padding: EdgeInsets.all(10.r),
            alignment: Alignment.center,
            child: Text(
              'Logo'.toUpperCase(),
              style: context.textTheme.titleLarge!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightSemiBold,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}

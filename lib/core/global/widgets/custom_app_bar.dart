import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.haveBackIcon = true,
    this.titleWidget,
    this.onBack,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final bool haveBackIcon;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (haveBackIcon)
                leading ??
                    IconButton(
                      onPressed: () {
                        if (onBack != null) {
                          onBack!();
                        } else {
                          Get.back();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.w,
                      ),
                    ),
              SizedBox(width: 10.w),
              titleWidget ??
                  Text(
                    title ?? '',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.theme.primaryColor,
                      fontWeight: kFontWeightSemiBold,
                      fontSize: 16.sp,
                    ),
                  ),
              const Spacer(),
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.055.sh);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import 'support_message_widget.dart';
import 'user_message_widget.dart';

class ChatWithSupportViewBody extends StatefulWidget {
  const ChatWithSupportViewBody({super.key});

  @override
  State<ChatWithSupportViewBody> createState() =>
      _ChatWithSupportViewBodyState();
}

class _ChatWithSupportViewBodyState extends State<ChatWithSupportViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        // vertical: kDefaultPadding.h,
      ),
      child: Column(
        children: [
          // const ChatWithSupportHeaderWidget(),
          SizedBox(height: kDefaultPadding.h),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              reverse: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 0.7.sw,
                  child: index.isEven
                      ? const SupportMessageWidget()
                      : const UserMessageWidget(),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: kDefaultPadding.h);
              },
            ),
          ),
          SizedBox(height: kDefaultPadding.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.enterTextHere.tr,
                hintStyle: context.textTheme.bodyMedium!.copyWith(
                  color: kHintColor,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(end: 15.w),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 18.sp,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: kHintColor,
                    width: 1.w,
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                filled: true,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding.h),
        ],
      ),
    );
  }
}

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
                      ? _buildSupportMessageWidget()
                      : _buildUserMessageWidget(),
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
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.paperPlane),
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

  _buildSupportMessageWidget() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 0.75.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: kWhiteColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.user,
                      color: kTextDarkColor,
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 1.h,
                  end: 1.w,
                  child: Container(
                    width: 10.w,
                    height: 10.5.w,
                    decoration: const BoxDecoration(
                      color: kOnlineColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: kDefaultPadding.w / 2),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter ',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightBold,
                    ),
                    maxLines: 100,
                  ),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      '01:15',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightLight,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildUserMessageWidget() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        color: kTextFieldFillColor,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w / 2,
          vertical: kDefaultPadding.h / 2,
        ),
        width: 0.75.sw,
        child: Column(
          children: [
            Text(
              'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter ',
              style: context.textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
              ),
              maxLines: 100,
            ),
            SizedBox(height: 1.5.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                '01:15',
                style: context.textTheme.bodySmall!.copyWith(
                  color: kTextDarkColor,
                  fontWeight: kFontWeightLight,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

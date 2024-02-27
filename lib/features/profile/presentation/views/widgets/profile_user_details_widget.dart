import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '/features/home/presentation/views/home_layout_imports.dart';
import '/features/profile/presentation/view_models/profile_cubit.dart';

class ProfileUserDetailsWidget extends StatelessWidget {
  const ProfileUserDetailsWidget({super.key, required this.cubit});
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.myProfile.tr,
          style: context.textTheme.titleLarge,
        ),
        SizedBox(height: 20.h),
        Stack(
          children: [
            CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey,
              backgroundImage: const NetworkImage(
                'https://jobdeck.io/assets/images/new-testimonial-1.webp',
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              child: IconButton(
                onPressed: () {},
                color: kPrimaryColor,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                ),
                icon: const Icon(
                  Icons.edit,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
        Text(
          cubit.profileModel?.userData.fullName ?? '',
          style: context.textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.locationDot,
              color: kPrimaryColor,
              size: 11.r,
            ),
            SizedBox(width: 1.5.w),
            Text(
              'Cairo, Egypt',
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

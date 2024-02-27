import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/widgets/custom_app_button.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import '/features/profile/presentation/view_models/profile_cubit.dart';
import 'widgets/profile_custom_text_form_field_widget.dart';
import 'widgets/profile_user_details_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _cubit = sl<ProfileCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.init();
  }

  @override
  void dispose() {
    _cubit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: 30.h,
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: _cubit..getProfileDetails(),
          builder: (context, state) {
            if (_cubit.profileModel == null && _cubit.profileError.isEmpty) {
              return const CustomLoadingWidget();
            } else if (_cubit.profileError.isNotEmpty) {
              return Container(
                alignment: Alignment.center,
                height: 1.sh,
                padding: EdgeInsets.only(bottom: 0.2.sh),
                child: CustomErrorWidget(
                  height: 0.2.sh,
                  message: _cubit.profileError,
                  onRetry: () {
                    _cubit.profileModel = null;
                    _cubit.profileError = '';

                    _cubit.getProfileDetails();
                  },
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileUserDetailsWidget(
                  cubit: _cubit,
                ),
                SizedBox(height: 20.h),
                ProfileCustomTextFormFieldWidget(
                  title: AppStrings.somethingAboutYou.tr,
                  controller: _cubit.somethingAboutController,
                ),
                ProfileCustomTextFormFieldWidget(
                  title: AppStrings.gender.tr,
                  controller: _cubit.genderController,
                ),
                ProfileCustomTextFormFieldWidget(
                  title: AppStrings.phoneNumber.tr,
                  controller: _cubit.phoneController,
                ),
                ProfileCustomTextFormFieldWidget(
                  title: AppStrings.email.tr,
                  controller: _cubit.emailController,
                ),
                Text(
                  '${AppStrings.location.tr} :',
                  style: context.textTheme.titleSmall!.copyWith(
                    fontWeight: kFontWeightBold,
                  ),
                ),
                SvgPicture.asset(
                  AssetsData.mapLocationImageSVG,
                  alignment: AlignmentDirectional.center,
                  width: 1.sw,
                ),
                SizedBox(height: 20.h),
                BlocBuilder<ProfileCubit, ProfileState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    return Align(
                      alignment: AlignmentDirectional.center,
                      child: CustomAppButton(
                        text: AppStrings.logout.tr,
                        onPressed: () {
                          return _cubit.logout();
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

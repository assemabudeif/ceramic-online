import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:ceramic_online/core/utilities/dummy.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:ceramic_online/core/utilities/routes_manger.dart';
import 'package:ceramic_online/features/home/presentation/views/widgets/home_best_sales_list_widget.dart';
import 'package:ceramic_online/features/home/presentation/views/widgets/home_products_for_you_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int _sizeGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  kDummyProducts[0].image,
                  width: 1.sw,
                ),
                Text(
                  kDummyProducts[0].name,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: kFontWeightBold,
                  ),
                ),
                Text(
                  kDummyProducts[0].description,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kHintColor,
                  ),
                  maxLines: 10,
                ),
                const SizedBox(height: kDefaultPadding),
                Text(
                  AppStrings.priceOnSelection.tr,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: kPrimaryColor,
                    fontWeight: kFontWeightBold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${kDummyProducts[0].price}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kPrimaryColor,
                        fontWeight: kFontWeightBold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (kDummyProducts[0].quantity > 1) {
                              setState(() {
                                kDummyProducts[0].quantity--;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            width: 0.09.sw,
                            padding: EdgeInsets.all(5.r),
                            alignment: Alignment.center,
                            child: Text(
                              '-',
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: kFontWeightBlack,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding.w,
                          ),
                          child: Text(
                            '${kDummyProducts[0].quantity}',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              kDummyProducts[0].quantity++;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            width: 0.09.sw,
                            padding: EdgeInsets.all(5.r),
                            alignment: Alignment.center,
                            child: Text(
                              '+',
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: kFontWeightBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                _defaultProductDetailsDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.yourChoiceOfSize.tr,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: kTextDarkColor,
                      ),
                    ),
                    _buildRequiredWidget(),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                RadioListTile<int>.adaptive(
                  value: 0,
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: _sizeGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _sizeGroupValue = value!;
                    });
                  },
                  title: Text(
                    '10cm x 10cm',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                ),
                RadioListTile<int>.adaptive(
                  value: 1,
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: _sizeGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _sizeGroupValue = value!;
                    });
                  },
                  title: Text(
                    '30cm x 30cm',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                ),
                _defaultProductDetailsDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.areaCalculation.tr,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: kTextDarkColor,
                      ),
                    ),
                    _buildRequiredWidget(),
                  ],
                ),
                SizedBox(height: kDefaultPadding.h / 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.height.tr,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: kTextDarkColor,
                            fontWeight: kFontWeightSemiBold,
                          ),
                        ),
                        SizedBox(width: kDefaultPadding.w / 3),
                        Container(
                          width: 0.2.sw,
                          height: 0.05.sh,
                          decoration: BoxDecoration(
                            color: kTextFieldFillColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding.w / 2,
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kTextDarkColor,
                              fontWeight: kFontWeightSemiBold,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '........M',
                              hintStyle: context.textTheme.bodyMedium!.copyWith(
                                color: kTextDarkColor,
                                fontWeight: kFontWeightSemiBold,
                              ),
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.width.tr,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: kTextDarkColor,
                            fontWeight: kFontWeightSemiBold,
                          ),
                        ),
                        SizedBox(width: kDefaultPadding.w / 3),
                        Container(
                          width: 0.2.sw,
                          height: 0.05.sh,
                          decoration: BoxDecoration(
                            color: kTextFieldFillColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding.w / 2,
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: kTextDarkColor,
                              fontWeight: kFontWeightSemiBold,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '........M',
                              hintStyle: context.textTheme.bodyMedium!.copyWith(
                                color: kTextDarkColor,
                                fontWeight: kFontWeightSemiBold,
                              ),
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.piecesYouNeed.tr,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightBold,
                      ),
                    ),
                    _buildRequiredWidget(
                      text: '30 ${AppStrings.piece.tr}',
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding.h / 2),
                _defaultProductDetailsDivider,
                Text(
                  AppStrings.oftenOrdersWith.tr,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding.h),
                const HomeProductsForYouListWidget(),
                SizedBox(height: kDefaultPadding.h),
                _defaultProductDetailsDivider,
                Text(
                  AppStrings.otherBrands.tr,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding.h),
                const HomeBestSalesListWidget(),
              ],
            ),
          ),
        ),
        Container(
          color: kWhiteColor,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.w,
            vertical: kDefaultPadding.h,
          ),
          child: MaterialButton(
            onPressed: () {
              Get.offAllNamed(Routes.homeLayoutPath);
            },
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            minWidth: 1.sw,
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.addToCart.tr,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: kWhiteColor,
                  ),
                ),
                Text(
                  AppStrings.priceOnSelection.tr,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: kWhiteColor,
                    fontWeight: kFontWeightSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _defaultProductDetailsDivider => Padding(
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding.h,
        ),
        child: Divider(
          color: kWhiteColor,
          thickness: 5.h,
          height: 1.h,
        ),
      );

  Widget _buildRequiredWidget({
    String text = AppStrings.required,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: kTextFieldFillColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
          vertical: kDefaultPadding.h / 2,
        ),
        child: Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: kPrimaryColor,
            fontWeight: kFontWeightBold,
          ),
        ),
      );
}

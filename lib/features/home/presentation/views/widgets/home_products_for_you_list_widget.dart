import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/global/language/app_strings.dart';

class HomeProductsForYouListWidget extends StatefulWidget {
  const HomeProductsForYouListWidget({super.key});

  @override
  State<HomeProductsForYouListWidget> createState() =>
      _HomeProductsForYouListWidgetState();
}

class _HomeProductsForYouListWidgetState
    extends State<HomeProductsForYouListWidget> {
  final List<ProductModel> _products = [
    for (int i = 0; i < 10; i++)
      ProductModel(
        name: 'Ceramic Black',
        image: AssetsData.productCeramicSVG,
        price: '22.00',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        quantity: 1,
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.5.sh,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Container(
            // height: 200.h,
            width: 0.6.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  _products[index].image,
                  width: 0.6.sw,
                ),
                Text(
                  _products[index].name,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _products[index].description,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 10.sp,
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${_products[index].price}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 5.h),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      minWidth: 0.09.sw,
                      height: 0.04.sh,
                      child: Text(
                        AppStrings.addToCart.tr,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: kWhiteColor,
                          fontWeight: kFontWeightSemiBold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_products[index].quantity > 1) {
                                setState(() {
                                  _products[index].quantity--;
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
                          Text(
                            '${_products[index].quantity}',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _products[index].quantity++;
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
                    ),
                  ],
                ),
              ],
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

class ProductModel {
  final String name;
  final String image;
  final String price;
  final String description;
  int quantity;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.quantity,
  });
}

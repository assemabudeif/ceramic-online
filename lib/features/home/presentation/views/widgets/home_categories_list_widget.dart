import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/core/utilities/assets_data.dart';

class HomeCategoriesListWidget extends StatefulWidget {
  const HomeCategoriesListWidget({super.key});

  @override
  State<HomeCategoriesListWidget> createState() =>
      _HomeCategoriesListWidgetState();
}

class _HomeCategoriesListWidgetState extends State<HomeCategoriesListWidget> {
  final List<CategoryModel> _categories = [
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Ceramic',
      image: AssetsData.ceramicCategoryIconSVG,
    ),
    CategoryModel(
      name: 'Tap',
      image: AssetsData.tapCategoryIconSVG,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Column(
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
                    _categories[index].image,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Text(_categories[index].name),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
      ),
    );
  }
}

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });
}

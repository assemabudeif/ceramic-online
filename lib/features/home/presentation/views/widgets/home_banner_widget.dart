import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/core/utilities/assets_data.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SvgPicture.asset(
          AssetsData.bannerSVG,
          width: 1.sw,
        ),
        SvgPicture.asset(
          AssetsData.bannerSVG,
          width: 1.sw,
        ),
        SvgPicture.asset(
          AssetsData.bannerSVG,
          width: 1.sw,
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

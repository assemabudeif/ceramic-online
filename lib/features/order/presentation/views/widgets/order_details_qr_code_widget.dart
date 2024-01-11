import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderDetailsQrCodeWidget extends StatelessWidget {
  const OrderDetailsQrCodeWidget({super.key, required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: DashedBorder.all(
            color: kQrBorderColor,
            dashLength: 40,
            width: 4,
            isOnlyCorner: true,
            strokeAlign: BorderSide.strokeAlignOutside,
            strokeCap: StrokeCap.round,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.w,
        ),
        child: QrImageView(
          data: code,
          version: QrVersions.auto,
          size: 0.4.sw,
          backgroundColor: kTransparentColor,
          dataModuleStyle: QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: kTextDarkColor,
          ),
          padding: EdgeInsets.zero,
          eyeStyle: QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: kTextDarkColor,
          ),
        ),
      ),
    );
  }
}

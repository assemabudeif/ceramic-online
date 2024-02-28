import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/home/presentation/views/home_layout_imports.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.height,
    required this.message,
    required this.onRetry,
  });
  final double height;
  final String message;
  final Function onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(0.05.sw),
      ),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.error,
          //   color: Colors.red,
          //   size: 0.1.sw,
          // ),
          // SizedBox(height: 0.01.sh),
          Text(
            message,
            style: context.textTheme.bodyLarge,
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.02.sh),
          SizedBox(
            width: 0.2.sw,
            child: ElevatedButton(
              onPressed: () {
                onRetry();
              },
              child: Text(
                AppStrings.retry.tr,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

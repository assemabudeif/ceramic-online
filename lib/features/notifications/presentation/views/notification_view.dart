import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:ceramic_online/features/home/presentation/views/home_layout_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notifications.tr,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
          vertical: kDefaultPadding.h,
        ),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Notification ${index + 1}',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: kFontWeightBold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notification_important,
                    color: kPrimaryColor,
                    size: 20.w,
                  ),
                ],
                // subtitle: Text('Notification $index'),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: 20,
      ),
    );
  }
}

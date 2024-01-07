import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.haveBackIcon = true,
    this.titleWidget,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final bool haveBackIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title ?? '',
            style: context.textTheme.titleMedium!.copyWith(
              color: context.theme.primaryColor,
              fontWeight: kFontWeightSemiBold,
            ),
          ),
      titleSpacing: 0,
      leading: haveBackIcon
          ? leading ??
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

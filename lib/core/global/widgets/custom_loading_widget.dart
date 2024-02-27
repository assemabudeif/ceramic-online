import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/features/home/presentation/views/home_layout_imports.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.isFullScreen = true,
  });

  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        bottom: 0.1.sh,
      ),
      height: isFullScreen ? 1.sh : null,
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: kPrimaryColor,
        size: 0.15.sh,
      ),
    );
  }
}

import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:ceramic_online/features/chat_with_support/presentation/view/widgets/chat_with_support_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_with_support_header_widget.dart';

class ChatWithSupportView extends StatelessWidget {
  const ChatWithSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        titleWidget: ChatWithSupportHeaderWidget(),
      ),
      body: ChatWithSupportViewBody(),
    );
  }
}

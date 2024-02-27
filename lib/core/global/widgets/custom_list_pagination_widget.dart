import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '/core/utilities/app_constance.dart';
import 'custom_empty_widget.dart';
import 'custom_loading_widget.dart';
import 'custom_no_more_items_widget.dart';

class CustomListPaginationWidget<T> extends StatelessWidget {
  const CustomListPaginationWidget({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
  });

  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext, T, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>.separated(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: itemBuilder,
        firstPageProgressIndicatorBuilder: (context) =>
            const CustomLoadingWidget(),
        noItemsFoundIndicatorBuilder: (_) => CustomEmptyWidget(
          height: 1.sh,
        ),
        noMoreItemsIndicatorBuilder: (_) => const CustomNoMoreItemsWidget(),
      ),
      separatorBuilder: (context, index) {
        return SizedBox(height: kDefaultPadding.h);
      },
    );
  }
}

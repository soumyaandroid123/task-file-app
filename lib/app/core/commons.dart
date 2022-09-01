import 'package:flutter/material.dart';
import 'package:task_file_app/app/core/utils/extension.dart';
import 'package:task_file_app/app/core/values/images.dart';

class Commons {
  static const baseRadius = 12.0;

  static AppBar appBar(
    BuildContext context, {
    required String label,
    required String taskLabel,
    List<Widget>? actions,
  }) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  profileImg,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 13.0),
                ),
                verticalSpaceTiny,
                Text(
                  taskLabel,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14.0.sp),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }

  static bool isBottom(
    ScrollController scrollController, [
    double scrollOffsetThreshold = 0.7,
  ]) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    return currentScroll >= (maxScroll * scrollOffsetThreshold) &&
        currentScroll > 0;
  }
}

const baseMargin = 8.0;

//* Horizontal Spacing
const Widget horizontalSpaceTiny = SizedBox(width: baseMargin / 2);
const Widget horizontalSpaceSmall = SizedBox(width: baseMargin);
const Widget horizontalSpaceRegular = SizedBox(width: baseMargin * 2);
const Widget horizontalSpaceMedium = SizedBox(width: baseMargin * 3);
const Widget horizontalSpaceLarge = SizedBox(width: baseMargin * 4);
const Widget bundleHorizontalSpacing = SizedBox(width: baseMargin * 1.5);

//* Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: baseMargin / 2);
const Widget verticalSpaceSmall = SizedBox(height: baseMargin);
const Widget verticalSpaceRegular = SizedBox(height: baseMargin * 2);
const Widget verticalSpaceMedium = SizedBox(height: baseMargin * 3);
const Widget verticalSpaceLarge = SizedBox(height: baseMargin * 4);
const Widget bundleVerticalSpacing = SizedBox(height: baseMargin * 1.5);

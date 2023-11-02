import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

AppBar conditionalAppBar(
    BuildContext context, String title, bool isAppbarTop, bool Function(ScrollNotification) notificationPredicate) {
  return AppBar(
    toolbarHeight: !isAppbarTop ? 5.w : 15.w,
    notificationPredicate: notificationPredicate,
    automaticallyImplyLeading: !isAppbarTop ? false : true,
    surfaceTintColor: Colors.white,
    shadowColor: !isAppbarTop ? Colors.transparent : Colors.grey,
    backgroundColor: !isAppbarTop ? Colors.white : Colors.white,
    title: !isAppbarTop
        ? const Center()
        : Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 10.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
  );
}

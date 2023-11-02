import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget(
      {super.key,
      required this.child,
      required this.onTap,
      this.height = 0,
      this.width = 40,
      this.color = Colors.transparent});
  final Widget child;
  final double height;
  final double width;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.w,
      width: width.w,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent), onTap: onTap, child: child),
    );
  }
}

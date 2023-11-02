import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon, required this.top, this.onTap, this.alignment = Alignment.topRight});
  final IconData icon;
  final double top;
  final void Function()? onTap;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Align(
        alignment: alignment,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 10.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 14.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

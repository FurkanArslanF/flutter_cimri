import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscountIconWidget extends StatelessWidget {
  const DiscountIconWidget({super.key, required this.discount, required this.top, this.alignment = Alignment.topLeft});
  final String discount;
  final double top;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Align(
        alignment: alignment,
        child: Container(
          width: 8.w,
          height: 5.w,
          decoration: const BoxDecoration(
            color: Colors.red,
            //borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              discount,
              style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cimri/global.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text, this.isIconVisible = false});
  final String text;
  final bool isIconVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        isIconVisible
            ? Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      TextGlobal.showAll,
                      style: context.general.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                  context.sized.emptySizedWidthBoxLow,
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.sp,
                    color: Colors.grey,
                  )
                ],
              )
            : const Center(),
      ],
    );
  }
}

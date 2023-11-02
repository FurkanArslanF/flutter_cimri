import 'package:flutter/material.dart';
import 'package:flutter_cimri/entity/dummy.dart';
import 'package:flutter_cimri/widget/global/frame.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoryList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return _ListWidget(index: index);
      },
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      onTap: () {
        debugPrint("Tapped $index");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            categoryList[index]["img"] as String,
            width: 15.w,
          ),
          context.sized.emptySizedHeightBoxLow,
          Text(
            categoryList[index]["title"] as String,
            textAlign: TextAlign.center,
            style: context.general.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 8.sp,
            ),
          ),
        ],
      ),
    );
  }
}

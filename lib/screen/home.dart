import 'package:flutter/material.dart';
import 'package:flutter_cimri/extras/sliver_appbar.dart';
import 'package:flutter_cimri/global.dart';
import 'package:flutter_cimri/widget/category.dart';
import 'package:flutter_cimri/widget/global/text.dart';
import 'package:flutter_cimri/widget/price_decrese.dart';
import 'package:flutter_cimri/widget/global/slider.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverSearchAppBar(context, TextGlobal.appBarTitle),
        SliverToBoxAdapter(
          child: Padding(
            padding: context.padding.horizontalNormal + context.padding.onlyBottomHigh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SliderWidget(),
                context.sized.emptySizedHeightBoxLow,
                TextWidget(text: TextGlobal.exploreCategories),
                context.sized.emptySizedHeightBoxLow,
                const _Category(),
                context.sized.emptySizedHeightBoxLow,
                TextWidget(text: TextGlobal.priceDrop, isIconVisible: true),
                context.sized.emptySizedHeightBoxLow,
                const _PriceDecrease(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PriceDecrease extends StatelessWidget {
  const _PriceDecrease();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 88.w,
      child: const PriceDecreseWidget(),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 94.w,
      child: const CategoryWidget(),
    );
  }
}

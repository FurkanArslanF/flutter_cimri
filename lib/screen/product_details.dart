import 'package:flutter/material.dart';
import 'package:flutter_cimri/entity/dummy.dart';
import 'package:flutter_cimri/extras/conditional_appbar.dart';
import 'package:flutter_cimri/global.dart';
import 'package:flutter_cimri/widget/global/discount_icon.dart';
import 'package:flutter_cimri/widget/global/eleveted_button.dart';
import 'package:flutter_cimri/widget/global/frame.dart';
import 'package:flutter_cimri/widget/global/icon.dart';
import 'package:flutter_cimri/widget/global/slider.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final dynamic product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late bool isAppbarTop = false;

  bool notificationPredicate(ScrollNotification notification) {
    bool shouldBeOnTop = notification.metrics.axis == Axis.vertical && notification.metrics.pixels > 50.w;
    if (shouldBeOnTop != isAppbarTop) {
      setState(() {
        isAppbarTop = shouldBeOnTop;
      });
    }
    return shouldBeOnTop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: conditionalAppBar(context, widget.product["title"], isAppbarTop, notificationPredicate),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _TopContainer(widget: widget),
            context.sized.emptySizedHeightBoxLow3x,
            const _PriceRow(),
            Container(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              height: (otherPrice.length * 40.w),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: otherPrice.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _OtherPriceList(index: index),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OtherPriceList extends StatelessWidget {
  const _OtherPriceList({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: FrameWidget(
        height: 8.w,
        width: 100.w,
        color: Colors.white,
        child: Padding(
          padding: context.padding.normal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${otherPrice[index]["price"]} TL",
                    style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    otherPrice[index]["transfer"] as String,
                    style: context.general.textTheme.bodySmall,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    otherPrice[index]["dealers"] as String,
                    style: context.general.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  context.sized.emptySizedHeightBoxLow,
                  SizedBox(
                    height: 8.w,
                    child: ElevetedButtonWidget(
                      onPressed: () {},
                      text: "Mağazaya git",
                    ),
                  ),
                  context.sized.emptySizedHeightBoxLow,
                  Text(
                    otherPrice[index]["date"] as String,
                    style: context.general.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TextGlobal.allPrice,
            style: context.general.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(TextGlobal.freeTransfer)
        ],
      ),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({
    required this.widget,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100.w,
      width: 100.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const SliderWidget(isProducts: true),
          IconWidget(
            icon: Icons.arrow_back,
            top: 1.w,
            onTap: () => Navigator.pop(context),
            alignment: Alignment.topLeft,
          ),
          DiscountIconWidget(discount: widget.product["discount"], top: 15.w),
          IconWidget(
            icon: Icons.notifications_none_outlined,
            top: 1.w,
            alignment: Alignment.topRight,
          ),
          IconWidget(
            icon: Icons.favorite_border_outlined,
            top: 12.w,
            alignment: Alignment.topRight,
          ),
          IconWidget(
            icon: Icons.share_sharp,
            top: 23.w,
            alignment: Alignment.topRight,
          ),
          Padding(
            padding: EdgeInsets.only(top: 55.w, left: 3.w, right: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product["title"] as String,
                  style: context.general.textTheme.bodySmall,
                ),
                context.sized.emptySizedHeightBoxLow,
                Text(
                  TextGlobal.otherProducts,
                  style: context.general.textTheme.bodySmall,
                ),
                const Spacer(
                  flex: 3,
                ),
                const Divider(),
                context.sized.emptySizedHeightBoxLow,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.product["price"]} TL",
                          style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.product["dealerImg"] as String,
                          style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevetedButtonWidget(
                      onPressed: () {},
                      text: TextGlobal.goCheapDelears,
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

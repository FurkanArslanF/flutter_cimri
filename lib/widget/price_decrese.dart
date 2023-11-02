import 'package:flutter/material.dart';
import 'package:flutter_cimri/entity/dummy.dart';
import 'package:flutter_cimri/screen/product_details.dart';
import 'package:flutter_cimri/widget/global/discount_icon.dart';
import 'package:flutter_cimri/widget/global/frame.dart';
import 'package:flutter_cimri/widget/global/icon.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class PriceDecreseWidget extends StatefulWidget {
  const PriceDecreseWidget({super.key});

  @override
  State<PriceDecreseWidget> createState() => _PriceDecreseWidgetState();
}

class _PriceDecreseWidgetState extends State<PriceDecreseWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: priceDecreaseList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.padding.onlyRightLow,
          child: _ListWidget(index: index),
        );
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: priceDecreaseList[index])));
      },
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(
                priceDecreaseList[index]["img"],
                height: 50.w,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: context.padding.low,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      priceDecreaseList[index]["title"],
                      style: TextStyle(fontSize: 8.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    Text(
                      priceDecreaseList[index]["dealerImg"],
                      style: TextStyle(fontSize: 8.sp),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    Text(
                      "${priceDecreaseList[index]["exPrice"]} TL",
                      style: TextStyle(
                        fontSize: 9.sp,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "${priceDecreaseList[index]["price"]} TL",
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    Text(
                      priceDecreaseList[index]["offer"],
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          DiscountIconWidget(discount: priceDecreaseList[index]["discount"], top: 5.5.w),
          IconWidget(icon: Icons.favorite_border, top: 3.w),
        ],
      ),
    );
  }
}

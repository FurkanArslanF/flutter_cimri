import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cimri/entity/dummy.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, this.isProducts = false});
  final bool isProducts;

  @override
  State<StatefulWidget> createState() {
    return _SliderWidgetState();
  }
}

class _SliderWidgetState extends State<SliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item["img"] as String,
                        fit: BoxFit.cover,
                        width: 100.w,
                      ),
                      widget.isProducts
                          ? const Center()
                          : Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(color: Colors.white),
                                padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.w),
                                child: Row(
                                  children: [
                                    Text(
                                      imgList[_current]["text"] as String,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    context.sized.emptySizedWidthBoxLow3x,
                                    Icon(Icons.arrow_right_alt_outlined, color: Colors.black, size: 20.sp)
                                  ],
                                ),
                              ),
                            ),
                    ],
                  )))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: widget.isProducts ? 60.w : 40.w,
            autoPlay: widget.isProducts ? false : true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Padding(
          padding: widget.isProducts ? EdgeInsets.only(top: 50.w) : EdgeInsets.only(top: 41.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: widget.isProducts ? 2.w : 3.w,
                  height: widget.isProducts ? 2.w : 3.w,
                  margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                    color: widget.isProducts
                        ? Colors.blue.withOpacity(_current == entry.key ? 0.5 : 0)
                        : Colors.black.withOpacity(_current == entry.key ? 0.5 : 0),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

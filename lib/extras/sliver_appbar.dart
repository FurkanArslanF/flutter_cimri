import 'package:flutter/material.dart';
import 'package:flutter_cimri/widget/global/search.dart';
import 'package:sizer/sizer.dart';

SliverAppBar sliverSearchAppBar(BuildContext context, String title) {
  return SliverAppBar(
    surfaceTintColor: Colors.white,
    shadowColor: Colors.grey,
    pinned: true,
    snap: false,
    floating: false,
    toolbarHeight: 15.w,
    expandedHeight: 25.w,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.zero,
      expandedTitleScale: 1,
      centerTitle: true,
      background: Center(
          child: Text(title, style: const TextStyle(color: Colors.blue, fontSize: 26, fontWeight: FontWeight.bold))),
      title: const SearchWidget(),
      //background: FlutterLogo(),
    ),
  );
}

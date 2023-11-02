import 'package:flutter/material.dart';
import 'package:flutter_cimri/global.dart';
import 'package:kartal/kartal.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyBottomLow + context.padding.onlyTopLow + context.padding.horizontalNormal,
      padding: context.padding.horizontalNormal,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, color: Colors.blue),
          context.sized.emptySizedWidthBoxLow3x,
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: TextGlobal.search,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

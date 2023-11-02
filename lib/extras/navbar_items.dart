import 'package:flutter/material.dart';
import 'package:flutter_cimri/screen/error.dart';
import 'package:flutter_cimri/screen/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarModel {
  NavbarModel._();
  static final instance = NavbarModel._();

  List<Widget> pages = [
    const HomeScreen(),
    const ErrorScreen(),
    const ErrorScreen(),
    const ErrorScreen(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          Icons.home_outlined,
        ),
        title: 'Anasayfa',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          Icons.search,
        ),
        title: 'Kategoriler',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          Icons.person_2_outlined,
        ),
        title: 'Hesabım',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          Icons.shopping_bag_outlined,
        ),
        title: 'Markette',
      ),
    ];
  }
}

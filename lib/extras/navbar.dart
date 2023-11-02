import 'package:flutter/material.dart';
import 'package:flutter_cimri/extras/navbar_items.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class NavbarWrapper extends StatefulWidget {
  const NavbarWrapper({super.key});

  @override
  State<NavbarWrapper> createState() => _NavbarWrapperState();
}

class _NavbarWrapperState extends State<NavbarWrapper> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
        context,
        navBarHeight: 15.w,
        bottomScreenMargin: 1,
        hideNavigationBarWhenKeyboardShows: false,
        controller: _controller,
        screens: NavbarModel.instance.pages,
        items: NavbarModel.instance.navBarsItems(),
        backgroundColor: Colors.white,
        navBarStyle: NavBarStyle.style6,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(days: 200),
        ),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
      ),
    );
  }
}

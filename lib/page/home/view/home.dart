import 'package:animations/animations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goka_app_merchant/generated/assets.dart';
import 'package:goka_app_merchant/helpers/responsive.dart';

import '../../../core/values/style.dart';
import '../../../widget/bottom_natvigation/animated_bottom_navigation_bar.dart';
import '../../../widget/indexed_transition_switcher.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Material(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
              backgroundColor: Style.background,
              body: Obx(() {
                return IndexedTransitionSwitcher(
                  transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      ) {
                    return FadeThroughTransition(
                      fillColor: Colors.transparent,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    );
                  },
                  index: controller.currentIndex.value,
                  children: controller.children,
                );
              }),
              bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                itemCount: controller.children.length,
                tabBuilder: (int index, bool isActive) {
                  return _buildBottomNavBar(context, isActive)[index];
                },
                backgroundColor: Style.backgroundBottom,
                activeIndex: controller.currentIndex.value,
                splashColor: context.theme.primaryColor,
                splashSpeedInMilliseconds: 300,
                notchSmoothness: NotchSmoothness.defaultEdge,
                gapLocation: GapLocation.center,
                onTap: controller.onSelectedItem,
              ),
            ),
          ),
        ),
      );
    });
  }

  List<Widget> _buildBottomNavBar(BuildContext context, bool isActive) {
    return [
      _buildBottomNavigationBarItem(
        context,
        'for_you'.tr,
        Assets.imagesFeatherBarChart2,
        Assets.imagesFeatherBarChart2,
        0,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'discover'.tr,
        Assets.imagesFeatherSearch,
        Assets.imagesFeatherSearch,
        1,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'favorites'.tr,
        Assets.imagesFeatherHeart,
        Assets.imagesFeatherHeart,
        2,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'me'.tr,
        Assets.imagesFeatherUser,
        Assets.imagesFeatherUser,
        3,
        isActive,
      ),
    ];
  }

  Widget _buildBottomNavigationBarItem(BuildContext context, String title,
      String iconUri, String activeIconUri, int idx, bool active) {
    return Padding(
      padding: EdgeInsets.only(top: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            crossFadeState:
            active ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 250),
            firstChild: SvgPicture.asset(
              activeIconUri,
            ),
            secondChild: SvgPicture.asset(
              iconUri,
            ),
          ),
          SizedBox(height: 4.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: active
                  ? context.textTheme.headline2?.color
                  : context.theme.unselectedWidgetColor,
              letterSpacing: -0.24,
            ),
          )
        ],
      ),
    );
  }
}

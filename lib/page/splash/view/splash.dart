import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goka_app_merchant/generated/assets.dart';
import 'package:goka_app_merchant/helpers/responsive.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/utils/screen_util.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);

    FlutterError.onError =
        (FlutterErrorDetails details, {bool forceReport = false}) {
      FlutterError.dumpErrorToConsole(details, forceReport: true);
    };

    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (splashController) {
          return Material(
            color: context.theme.backgroundColor,
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                backgroundColor: context.theme.backgroundColor,
                body: Container(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    Assets.lottiesIntroAnimation,
                    width: 300.w,
                    height: 300.w,
                    fit: BoxFit.scaleDown,
                    repeat: true,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

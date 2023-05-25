import 'dart:async';

import 'package:get/get.dart';

import '../../../core/routes/app_pages.dart';

class SplashController extends GetxController {
  StreamController<DateTime>? event;
  Timer? timer;

  @override
  void onInit() {
    // UIUtil.changeStatusColor(Get.theme.backgroundColor, animate: true);
    // UIUtil.changeStatusItemWhiteColor();
    config();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // configListener.cancel()
  }

  config() {
    timer = Timer.periodic(Duration(seconds: 5), (t) {
      Get.offNamed(Routes.HOME);
    });
  }
}

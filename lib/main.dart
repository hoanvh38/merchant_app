import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:statusbarz/statusbarz.dart';

import 'core/routes/app_pages.dart';
import 'core/translation/translation_service.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: StatusbarzCapturer(
        child: GetMaterialApp(
          defaultTransition: Transition.rightToLeft,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}


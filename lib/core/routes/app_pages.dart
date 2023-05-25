import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../page/home/binding/home_binding.dart';
import '../../page/home/view/home.dart';
import '../../page/splash/view/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}

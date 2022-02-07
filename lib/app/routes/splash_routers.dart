
import 'package:dartweek/app/modules/splash/splash_bindings.dart';
import 'package:dartweek/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage> [
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
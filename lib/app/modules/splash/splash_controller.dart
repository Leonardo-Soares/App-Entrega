import 'package:dartweek/app/core/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
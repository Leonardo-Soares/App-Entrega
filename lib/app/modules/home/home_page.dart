import 'package:dartweek/app/core/services/auth_service.dart';
import 'package:dartweek/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Produtos'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
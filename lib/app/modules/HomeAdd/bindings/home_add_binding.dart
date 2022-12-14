import 'package:get/get.dart';

import '../controllers/home_add_controller.dart';

class HomeAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAddController>(
      () => HomeAddController(),
    );
  }
}

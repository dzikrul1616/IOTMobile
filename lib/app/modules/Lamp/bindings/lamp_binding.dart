import 'package:get/get.dart';

import '../controllers/lamp_controller.dart';

class LampBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LampController>(
      () => LampController(),
    );
  }
}

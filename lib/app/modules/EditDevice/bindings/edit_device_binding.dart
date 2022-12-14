import 'package:get/get.dart';

import '../controllers/edit_device_controller.dart';

class EditDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDeviceController>(
      () => EditDeviceController(),
    );
  }
}

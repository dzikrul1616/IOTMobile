import 'package:get/get.dart';

import '../modules/Add/bindings/add_binding.dart';
import '../modules/Add/views/add_view.dart';
import '../modules/EditDevice/bindings/edit_device_binding.dart';
import '../modules/EditDevice/views/edit_device_view.dart';
import '../modules/EditProfil/bindings/edit_profil_binding.dart';
import '../modules/EditProfil/views/edit_profil_view.dart';
import '../modules/HomeAdd/bindings/home_add_binding.dart';
import '../modules/HomeAdd/views/home_add_view.dart';
import '../modules/Lamp/bindings/lamp_binding.dart';
import '../modules/Lamp/views/lamp_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => MemoStateful(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.LAMP,
      page: () => const LampView(),
      binding: LampBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADD,
      page: () => const HomeAddView(),
      binding: HomeAddBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => const EditProfilView(),
      binding: EditProfilBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DEVICE,
      page: () => EditDeviceView(),
      binding: EditDeviceBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddView(),
      binding: AddBinding(),
    ),
  ];
}

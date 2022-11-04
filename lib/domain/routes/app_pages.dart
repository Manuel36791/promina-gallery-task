import 'package:get/get.dart';
import 'package:pro_mina_task/presentation/gallery/screen/gallery_screen.dart';

import '../../presentation/gallery/bindings/gallery_binding.dart';
import '../../presentation/login/bindings/login_binding.dart';
import '../../presentation/login/screens/login_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.GALLERY,
      page: () => const GalleryScreen(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}

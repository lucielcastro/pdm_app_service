import 'package:get/get.dart';
import '../pages/initial_page/initial_page.dart';
import '../pages/login_page/login_page.dart';
import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: Routes.initial, page: () => InitialPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
  ];
}

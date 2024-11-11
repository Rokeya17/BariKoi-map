import 'package:barikoi_map/views/home_view.dart';
import 'package:barikoi_map/views/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomePage()),
  ];
}

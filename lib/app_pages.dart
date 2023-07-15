import 'package:get/route_manager.dart';
import 'package:jualan/bindings/app_bindings.dart';
import 'package:jualan/pages/home/home_dashboard.dart';

abstract class AppRoutes {
  static const homePage = '/';
  static const calculatePage = '/calculate';
  static const optionsPage = '/options';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: (() => HomeDashboard()),
      binding: HomeBinding(),
    ),
  ];
}

import 'package:get/instance_manager.dart';
import 'package:jualan/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
  
}
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  void changeTabIndex(int index){
    currentIndex.value =index;
  }
}
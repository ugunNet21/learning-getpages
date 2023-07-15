import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CalculateController extends GetxController {
final counter = 0.obs;
final mincounter = 0;

void incrementCounter() {
  counter.value++;
}
void decrementCounter(){
  if(counter.value > mincounter){
    counter.value--;
  }
}
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jualan/controllers/calculate_controller.dart';


class CalculatePage extends GetView<CalculateController> {
  const CalculatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Get.put(CalculateController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            elevation: 1,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            elevation: 1,
          ),
        ],
      ),
    );
  }
}

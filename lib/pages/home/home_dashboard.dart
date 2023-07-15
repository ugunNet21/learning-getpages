import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jualan/controllers/home_controller.dart';
import 'package:jualan/pages/calculates/calculat_page.dart';
import 'package:jualan/pages/home/home_tab.dart';
import 'package:jualan/pages/disscus/disscusion_page.dart';
import 'package:jualan/pages/profile/profile_page.dart';

class HomeDashboard extends GetView<HomeController> {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Obx(() {
        final currentIndex = controller.currentIndex.value;
        switch (currentIndex) {
          case 0:
            return const HomeTab();
          case 1:
            return const CalculatePage(title: "Calcualate");
          case 2:
            return const DisscusionPage();
          case 3:
            return const MyProfile();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.grey[700], ),
          
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Diskusi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

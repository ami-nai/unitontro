import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable for the selected index

  void changeIndex(int index) {
    selectedIndex.value = index; // Update the selected index
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());
  final List<BottomNavigationBarItem> items = const [
                BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Routine'),
                BottomNavigationBarItem(icon: Icon(Icons.bus_alert), label: 'bus'),
                BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'cafeteria'),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
              ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.changeIndex(index); // Update the index using the controller
              },
              type: BottomNavigationBarType.shifting,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.orange.shade700,
              unselectedItemColor: Colors.grey.shade400,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: items,
            )),
      ),
    );
  }
}
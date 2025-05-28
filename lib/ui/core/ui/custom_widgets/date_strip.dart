import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateStripController extends GetxController {
  var selectedDateIndex = 0.obs;

  void changeSelectedDateIndex(int index) {
    selectedDateIndex.value = index;
  }
}
class DateStrip extends StatelessWidget {
  DateStrip({super.key});

  // Initialize controller properly (do this only once in your app)
  final DateStripController controller = Get.put(DateStripController());

  final List<String> dateNumbers = ['19', '20', '21', '22', '23', '24', '25'];
  final List<String> dateDays = ['WED', 'THU', 'FRI', 'SAT', 'SUN', 'MON', 'TUE'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dateNumbers.length,
        itemBuilder: (context, index) {
          return Obx(() {  // Move Obx here to wrap only the reactive part
            bool isSelected = index == controller.selectedDateIndex.value;
            return GestureDetector(
              onTap: () => controller.changeSelectedDateIndex(index),
              child: Container(
                width: 50,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade600 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateDays[index],
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected ? Colors.white70 : Colors.grey.shade500,
                        fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dateNumbers[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
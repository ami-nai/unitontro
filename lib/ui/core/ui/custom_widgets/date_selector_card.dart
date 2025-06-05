import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unitontro/ui/core/ui/custom_widgets/classes.dart';
import 'package:unitontro/ui/core/ui/custom_widgets/date_strip.dart';

class DateSelectorController extends GetxController {
  var classes = Classes().classeses.obs;

  void updateClasses() {
    classes.value = Classes().classeses;
  }
}



class DateSelectorCard extends StatelessWidget {
  DateSelectorCard({super.key});

  final classes = Classes().classeses.obs;

  GetxController controller = Get.put(DateSelectorController());

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
         border: Border.all(color: Colors.orange.shade100, width: 1.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sunday, Aug 23', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey.shade800,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.filter_list, color: Colors.grey.shade600, size: 20),
                  const SizedBox(width: 8),
                  Icon(Icons.more_horiz, color: Colors.grey.shade600, size: 20),
                ],
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            
            'Have 6 Schedules Today', 
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 15),
          DateStrip(),
        ],
      ),
    );
  }

}

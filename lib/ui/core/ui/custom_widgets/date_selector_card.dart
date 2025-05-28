import 'package:flutter/material.dart';
import 'package:unitontro/ui/core/ui/custom_widgets/date_strip.dart';


class DateSelectorCard extends StatelessWidget {
  DateSelectorCard({super.key});

  final List<Map<String, dynamic>> classes = [
    {
      'subject': 'Physics',
      'time': '12 am - 14 pm',
      'type': 'Class',
      'members': 5,
      'color': Colors.purple.shade50,
      'textColor': Colors.purple.shade800,
      'avatars': [
        '', 
        '',
        '',
      ]
    },
    {
      'subject': 'Geometry',
      'time': '14 pm - 16 pm',
      'type': 'Consultation',
      'members': 7,
      'color': Colors.green.shade50,
      'textColor': Colors.green.shade800,
      'avatars': [
        '',
        '',
        '',
      ]
    },
    {
      'subject': 'Chemistry',
      'time': '16 pm - 18 pm',
      'type': 'Class',
      'members': 7,
      'color': Colors.orange.shade50,
      'textColor': Colors.orange.shade800,
       'avatars': [
        '',
        '',
        '',
      ]
    },
    {
      'subject': 'Physics',
      'time': '12 am - 14 pm',
      'type': 'Class',
      'members': 5,
      'color': Colors.purple.shade50,
      'textColor': Colors.purple.shade800,
      'avatars': [
        '', 
        '',
        '',
      ]
    }
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
            'Have ${classes.length} Schedules Today', 
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 15),
          DateStrip(),
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';

class IndividualRoutinePage extends StatefulWidget {
  const IndividualRoutinePage({super.key});

  @override
  State<IndividualRoutinePage> createState() => _IndividualRoutinePageState();
}

class _IndividualRoutinePageState extends State<IndividualRoutinePage> {
  int _selectedDateIndex = 4;
  int _bottomNavIndex = 0;

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
  ];

  final List<String> dateNumbers = ['19', '20', '21', '22', '23', '24', '25'];
  final List<String> dateDays = ['WED', 'THU', 'FRI', 'SAT', 'SUN', 'MON', 'TUE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            
          },
        ),
        title: const Text(
          "Today's Classes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildDateSelectorCard(),
              const SizedBox(height: 30),
              _buildClassList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


  Widget _buildDateSelectorCard() {
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
          _buildDateStrip(),
        ],
      ),
    );
  }

  Widget _buildDateStrip() {
    return SizedBox(
      height: 65, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dateNumbers.length,
        itemBuilder: (context, index) {
          bool isSelected = index == _selectedDateIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDateIndex = index;
              });
            },
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
                      fontWeight: FontWeight.w500
                    ),
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
        },
      ),
    );
  }

   Widget _buildClassList() {
     return Column(
       children: classes.map((classInfo) => _buildClassItem(classInfo)).toList(),
     );
   }

  Widget _buildClassItem(Map<String, dynamic> classInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), 
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: classInfo['color'],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        classInfo['subject'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        classInfo['type'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: classInfo['textColor'],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    classInfo['time'],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAvatarRow(classInfo['avatars']),
                      Text(
                        '+ ${classInfo['members']} members',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildAvatarRow(List<String> avatarUrls) {

      return Row(
        children: avatarUrls.map((url) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(url), 
                
                backgroundColor: Colors.grey.shade300,
              ),
            )).toList(),
      );
   }

  Widget _buildBottomNavigationBar() {

    return Container(
       decoration: BoxDecoration(
         borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
         boxShadow: [
           BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0, blurRadius: 10),
         ],
       ),
      child: ClipRRect( 
         borderRadius: const BorderRadius.only(
           topLeft: Radius.circular(30.0),
           topRight: Radius.circular(30.0),
         ),
         child: BottomNavigationBar(
           currentIndex: _bottomNavIndex,
           onTap: (index) {
             setState(() {
               _bottomNavIndex = index;
             });
           },
           type: BottomNavigationBarType.fixed, 
           backgroundColor: Colors.white,
           selectedItemColor: Colors.orange.shade700,
           unselectedItemColor: Colors.grey.shade400,
           showSelectedLabels: false,
           showUnselectedLabels: false,
           items: const [
             BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
             BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
             BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
             BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
           ],
         ),
       ),
    );
  }
}
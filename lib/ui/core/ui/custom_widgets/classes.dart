import 'package:flutter/material.dart';
import 'package:unitontro/data/model/class_model.dart';
import 'package:unitontro/data/repositories/class_repository.dart';

class Classes extends StatelessWidget {
  Classes({super.key});

  List<ClassInfo> classeses = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClassInfo>>(
      future: ClassRepository().getClasses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No class found'));
        }
        
        return _buildClassList(snapshot.data!);
      },
    );
  }

  Widget _buildClassList(List<ClassInfo> classes) {
    classeses = classes;
    return Column(
      children: classes.map((classInfo) => _buildClassItem(classInfo)).toList(),
    );
  }

  Widget _buildClassItem(ClassInfo classInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), 
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: classInfo.color,
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
                        classInfo.subject,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        classInfo.type.toString().split('.').last,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: classInfo.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    classInfo.time,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAvatarRow(classInfo.avatarUrls),
                      Text(
                        '+ ${classInfo.members} members',
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
}
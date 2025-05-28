import 'package:flutter/material.dart';

class ClassInfo {
  final String id;
  final String subject;
  final String time;
  final ClassType type;
  final int members;
  final Color color;
  final Color textColor;
  final List<String> avatarUrls;

  ClassInfo({
    required this.id,
    required this.subject,
    required this.time,
    required this.type,
    required this.members,
    required this.color,
    required this.textColor,
    required this.avatarUrls
  });

  factory ClassInfo.fromSupabase(Map<String, dynamic> data) {
    return ClassInfo(
      id: data['id'] as String,
      subject: data['subject'] as String,
      time: data['time'] as String,
      type: ClassType.values.firstWhere(
        (e) => e.toString().split('.').last == data['type'],
        orElse: () => ClassType.lecture,
      ),
      members: data['members'] as int,
      color: _colorFromString(data['color']),
      textColor: _colorFromString(data['text_color']),
      avatarUrls: List<String>.from(data['avatars'] ?? []),
    );
  }

  static Color _colorFromString(String colorString) {
    // Implement your color parsing logic here
    // Example: "purple50" -> Colors.purple.shade50
    return Colors.purple.shade50; // Simplified for example
  }

}

enum ClassType{
  lecture,
  lab,
  tutorial,
  seminar,
  workshop,
  lunch,
}
import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final IconData? icon;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isMeetingTask;

  Task({
    required this.title,
    required this.description,
    this.icon,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isMeetingTask = false,
  });
}

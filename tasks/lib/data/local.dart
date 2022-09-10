import 'package:flutter/material.dart';

import '../models/task.dart';

List<Task> tasks = [
  Task(
      title: 'Team Meeting',
      description: 'Discuss all questions about new projects',
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      isMeetingTask: true),
  Task(
    title: 'Call the stylist',
    description: 'Agree on an evening look',
    date: DateTime.now(),
    icon: Icons.phone_rounded,
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
  Task(
    title: 'Check mail',
    icon: Icons.mail_rounded,
    description: 'Write to manager',
    date: DateTime.now(),
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
  ),
];

List<String> categories = [
  'Development',
  'Research',
  'Design',
  'Backend',
  'Meeting',
  'Other',
];

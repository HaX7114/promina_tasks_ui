import 'package:flutter/material.dart';
import 'package:tasks/presentation/home_screen/home_screen.dart';
import 'package:tasks/utils/theme/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      home: const HomeScreen(),
    );
  }
}

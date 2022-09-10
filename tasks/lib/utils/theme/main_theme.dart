import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: transparentColor, // status bar color
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: whiteColor,
    ),
    primarySwatch: Colors.blue,
  );
}

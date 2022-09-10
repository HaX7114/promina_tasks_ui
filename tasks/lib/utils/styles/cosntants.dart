//Doubles
import 'package:flutter/material.dart';

const double fontSizeM = 14.0;
const double fontSizeL = 18.0;
const double radius = 20.0;
const double mainPadding = 20.0;

//Shadows
setShadow({color}) {
  return [BoxShadow(color: color ?? Colors.black12, blurRadius: 10.0)];
}

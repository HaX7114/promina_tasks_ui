import 'package:flutter/cupertino.dart';

class DeviceDimensions {
  static double? _height;
  static double? _width;

  static double getHeightOfDevice(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return _height as double;
  }

  static double getWidthOfDevice(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return _width as double;
  }
}

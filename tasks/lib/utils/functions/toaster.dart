import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';
import '../styles/cosntants.dart';

void showToastMessage(String msg, {dynamic color, dynamic textColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: color ?? whiteColor,
    textColor: textColor ?? blackColor,
    fontSize: fontSizeL - 5,
  );
}

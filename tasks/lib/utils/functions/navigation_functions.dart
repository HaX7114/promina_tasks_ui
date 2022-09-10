import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

navigateTo(context, page, {transition}) {
  Navigator.push(
    context,
    PageTransition(
      type: transition ?? PageTransitionType.rightToLeftWithFade,
      child: page,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
    ),
  );
}

navigateToWithReplace(context, page, {transition}) {
  Navigator.pushReplacement(
    context,
    PageTransition(
        type: transition ?? PageTransitionType.rightToLeftWithFade,
        child: page,
        duration: const Duration(milliseconds: 400)),
  );
}

navigateBack(context) {
  Navigator.pop(context);
}

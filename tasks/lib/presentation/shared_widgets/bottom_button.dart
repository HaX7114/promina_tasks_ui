import 'package:flutter/material.dart';

import '../../utils/styles/cosntants.dart';
import '../../utils/styles/spaces.dart';
import 'my_button.dart';

class ButtomButton extends StatelessWidget {
  final buttonText;
  final onPressed;
  const ButtomButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        K_expandedSpace,
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white70, Colors.white10],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.3, 0.9])),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyButton(
              height: 55.0,
              textSize: fontSizeM - 1,
              text: buttonText,
              onPressed: onPressed,
            ),
          ),
        )
      ],
    );
  }
}

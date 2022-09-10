import 'package:flutter/material.dart';

import '../../../data/constants.dart';
import '../../../utils/styles/colors.dart';
import '../../../utils/styles/cosntants.dart';

class CircleAvatarContainer extends StatelessWidget {
  const CircleAvatarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: setShadow(),
          color: blueColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(radius * 5),
          ),
        ),
        width: 150,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(
                  manOneImagePath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

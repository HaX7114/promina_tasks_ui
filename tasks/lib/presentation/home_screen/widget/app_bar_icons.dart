import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tasks/utils/styles/colors.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Ionicons.menu,
            color: blackColor,
            size: 30.0,
          ),
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.notifications_outline,
                color: blueColor,
                size: 30.0,
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 12.0,
                start: 10.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 4.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}

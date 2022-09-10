import 'package:flutter/material.dart';

class SmallImageContainer extends StatelessWidget {
  final String imagePath;
  const SmallImageContainer({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.0,
      width: 33.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/styles/colors.dart';
import '../../utils/styles/cosntants.dart';
import 'my_text.dart';

class MyButton extends StatelessWidget {
  final onPressed;
  final text;
  final textColor;
  final textSize;
  final fillColor;
  final borderColor;
  final fontWeight;
  final shadow;
  final buttonWidth;
  final borderRadius;
  final height;

  const MyButton({
    Key? key,
    this.text,
    this.height,
    this.buttonWidth,
    this.textSize,
    this.fontWeight,
    this.shadow,
    this.textColor,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? whiteColor),
        borderRadius: BorderRadius.circular(borderRadius ?? radius),
      ),
      height: height ?? 60.0,
      width: buttonWidth,
      child: RawMaterialButton(
        elevation: shadow ?? 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0.0,
        onPressed: onPressed,
        fillColor: fillColor ?? blueColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? radius)),
        child: MyText(
          text: text,
          size: textSize ?? 15.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? whiteColor,
        ),
      ),
    );
  }
}

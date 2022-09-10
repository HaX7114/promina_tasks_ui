import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles/colors.dart';

class MyTextField extends StatelessWidget {
  final hintText;
  final hintTextColor;
  final isEmailField;
  final isPasswordField;
  final labelText;
  final labelTextColor;
  final obscureText;
  final prifixIcon;
  final borderColor;
  final maxlength;
  final borderRadius;
  final validatorText;
  final suffixIcon;
  ValueChanged<String>? onChange;
  final TextEditingController textController;

  MyTextField({
    Key? key,
    this.hintText,
    this.hintTextColor,
    this.labelText,
    this.labelTextColor,
    this.maxlength,
    this.suffixIcon,
    this.isEmailField = false, //default,
    this.isPasswordField = false, //default,
    this.obscureText,
    required this.borderColor,
    required this.validatorText,
    this.prifixIcon,
    required this.textController,
    this.borderRadius,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText ?? false,
      maxLength: maxlength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      onChanged: onChange,
      style: GoogleFonts.poppins(
        color: labelTextColor ?? blackColor,
        fontSize: 13.0,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prifixIcon,
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          color: labelTextColor ?? blackColor,
          fontSize: 13.0,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: hintTextColor ?? greyColor,
          fontSize: 13.0,
        ),
        errorStyle: GoogleFonts.poppins(
          fontSize: 13.0,
        ),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: borderColor,
        )),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: borderColor,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: borderColor,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: borderColor,
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.data,
      this.textColor,
      this.fontWeight,
      this.textDecoration,
      this.fontSize});

  final String data;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: fontSize ?? 18,
          color: textColor ?? Colors.indigo,
          fontWeight: fontWeight ?? FontWeight.w700,
          decoration: textDecoration ?? TextDecoration.underline),
    );
  }
}

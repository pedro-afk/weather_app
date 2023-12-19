import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.decoration,
    this.textDecorationStyle,
    this.decorationThickness,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final Color? color;
  final TextDecoration? decoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecorationStyle? textDecorationStyle;
  final double? decorationThickness;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        decoration: decoration,
        decorationStyle: textDecorationStyle,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
      ),
    );
  }
}

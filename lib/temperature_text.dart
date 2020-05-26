import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colorPrimary;
  final Color colorSecondary;
  final FontWeight fontWeightPrimary;
  final FontWeight fontWeightSecondary;

  const TemperatureText({
    Key key,
    @required this.text,
    @required this.fontSize,
    this.colorPrimary = Colors.black87,
    this.colorSecondary = Colors.black54,
    this.fontWeightPrimary = FontWeight.w400,
    this.fontWeightSecondary = FontWeight.w300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: colorPrimary,
            fontWeight: fontWeightPrimary,
          ),
        ),
        Text(
          '°',
          style: TextStyle(
            fontSize: fontSize,
            color: colorSecondary,
            fontWeight: fontWeightSecondary,
          ),
        ),
      ],
    );
  }
}

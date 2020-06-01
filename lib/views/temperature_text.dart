import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/weather_api.dart';

class TemperatureText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colorPrimary;
  final Color colorSecondary;
  final FontWeight fontWeightPrimary;
  final FontWeight fontWeightSecondary;
  final MainAxisAlignment mainAxisAlignment;
  final String unit;

  const TemperatureText({
    Key key,
    @required this.text,
    @required this.fontSize,
    this.colorPrimary = Colors.black87,
    this.colorSecondary = Colors.black54,
    this.fontWeightPrimary = FontWeight.w400,
    this.fontWeightSecondary = FontWeight.w300,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.unit = CELCIUS,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
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
        Visibility(
          visible: unit != null && unit.isNotEmpty,
          child: Text(
            unit,
            style: TextStyle(
              fontSize: fontSize,
              color: colorPrimary,
              fontWeight: fontWeightPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

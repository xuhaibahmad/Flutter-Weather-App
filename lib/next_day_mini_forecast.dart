import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './temperature_text.dart';

class NextDayMiniForecast extends StatelessWidget {
  const NextDayMiniForecast({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 80.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Next Day',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            FlutterIcons.md_rainy_ion,
            color: Colors.deepPurple[900],
            size: 30,
          ),
          TemperatureText(
            text: "24",
            fontSize: 20.0,
            colorPrimary: Colors.black87,
            fontWeightPrimary: FontWeight.w400,
            colorSecondary: Colors.black54,
            fontWeightSecondary: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './temperature_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextDayMiniForecast extends StatelessWidget {
  final String temperature;
  final String icon;

  const NextDayMiniForecast({
    Key key,
    this.temperature,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 80.0,
      ),
      child: Visibility(
        visible: this.temperature.isNotEmpty,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Tomorrow',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
            SvgPicture.asset(
              this.icon,
              width: 30,
              height: 30,
            ),
            TemperatureText(
              text: this.temperature,
              fontSize: 20.0,
              colorPrimary: Colors.black87,
              fontWeightPrimary: FontWeight.w400,
              colorSecondary: Colors.black54,
              fontWeightSecondary: FontWeight.w300,
            ),
          ],
        ),
      ),
    );
  }
}

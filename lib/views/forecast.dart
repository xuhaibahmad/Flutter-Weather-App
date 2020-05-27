import 'package:flutter/material.dart';
import '../views/next_day_mini_forecast.dart';
import '../views/temperature_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastWidget extends StatelessWidget {
  final String description;
  final String location;
  final String temperature;
  final String icon;
  final String nextTemperature;
  final String nextIcon;

  const ForecastWidget({
    Key key,
    @required this.description,
    @required this.location,
    @required this.temperature,
    @required this.icon,
    @required this.nextTemperature,
    @required this.nextIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                this.description,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                this.location,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Visibility(
            visible: this.temperature.isNotEmpty,
            child: Column(
              children: [
                SvgPicture.asset(
                  this.icon,
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 16,
                ),
                TemperatureText(
                  text: this.temperature,
                  fontSize: 40.0,
                ),
              ],
            ),
          ),
          NextDayMiniForecast(
            temperature: this.nextTemperature,
            icon: this.nextIcon,
          ),
        ],
      ),
    );
  }
}

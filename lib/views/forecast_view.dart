import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import '../views/mini_forecast_view.dart';
import '../views/temperature_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastWidget extends StatelessWidget {
  final ForecastViewModel viewModel;

  const ForecastWidget({
    Key key,
    @required this.viewModel,
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
                viewModel.description,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                viewModel.location,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Visibility(
            visible: viewModel.temperature.isNotEmpty,
            child: Column(
              children: [
                SvgPicture.asset(
                  viewModel.icon,
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 16,
                ),
                TemperatureText(
                  text: viewModel.temperature,
                  fontSize: 40.0,
                ),
              ],
            ),
          ),
          NextDayMiniForecast(
            temperature: viewModel.nextTemperature,
            icon: viewModel.nextIcon,
          ),
        ],
      ),
    );
  }
}

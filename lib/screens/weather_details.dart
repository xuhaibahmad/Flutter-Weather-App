import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';

class WeatherDetails extends StatelessWidget {
  final ForecastViewModel viewModel;

  const WeatherDetails({Key key, @required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(child: Text("${viewModel.description}")),
    );
  }
}

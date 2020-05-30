import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/bloc/weather_settings/weather_settings_bloc.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import './screens/home.dart';
import 'bloc/weather/weather_bloc.dart';
import 'data/weather_api.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = WeatherRepository(WeatherApi());
    repository.init();

    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            builder: (_) => WeatherBloc(repository),
          ),
          BlocProvider<WeatherSettingsBloc>(
            builder: (_) => WeatherSettingsBloc(repository),
          ),
        ],
        child: Home(),
      ),
    );
  }
}

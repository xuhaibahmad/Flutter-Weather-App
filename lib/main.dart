import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/state/weather_store.dart';
import 'package:provider/provider.dart';
import './screens/home.dart';
import 'data/weather_api.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider(
        create: (_) => WeatherStore(WeatherApi()),
        child: Home(),
      ),
    );
  }
}

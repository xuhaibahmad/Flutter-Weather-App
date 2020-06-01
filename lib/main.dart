import 'package:auto_route/auto_route.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/router/router.gr.dart';
import 'di/injection.dart';

void main() {
  configureInjection();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    final repository = getIt<WeatherRepository>();
    repository.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExtendedNavigator<Router>(
        router: Router(),
      ),
      initialRoute: Routes.homePage,
    );
  }
}

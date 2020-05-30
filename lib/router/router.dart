import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/screens/weather_details.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  Home homePage;
  @MaterialRoute()
  WeatherDetails detailsPage;
}

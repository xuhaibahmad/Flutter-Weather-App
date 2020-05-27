import 'package:flutter/material.dart';
import '../views/nav_drawer_icon.dart';
import '../views/nav_drawer.dart';
import '../views/next_day_mini_forecast.dart';
import '../views/temperature_text.dart';
import '../models/forecast.dart';
import '../models/weather_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/secrets_loader.dart';
import '../data/weather_api.dart';

const API_KEY = "OpenWeatherApiKey";
const SECRETS_FILE_PATH = "assets/secrets.json";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String errorMessage = "";
  String description = "";
  String location = "";
  String temperature = "";
  String icon = WeatherIcon.getDefault();
  String nextTemperature = "";
  String nextIcon = WeatherIcon.getDefault();

  @override
  void initState() {
    super.initState();
    SecretLoader(secretPath: SECRETS_FILE_PATH)
        .load()
        .then((secrets) {
          final apiKey = secrets[API_KEY];
          final weatherApi = WeatherApi(apiKey);
          return weatherApi.getWeatherForecast(33.44, -94.04);
        })
        .then((value) => updateForecast(value))
        .catchError((e) => showInSnackBar(e.message));
  }

  updateForecast(Forecast forecast) {
    setState(() {
      final weather = forecast.current.weather.first;
      final tomorrow = forecast.daily.first;
      this.description = weather.main;
      String timezone = forecast.timezone;
      timezone = timezone.contains("/") ? timezone.split("/").last : timezone;
      this.location = timezone;
      this.temperature = forecast.current.temp.toInt().toString();
      this.icon = WeatherIcon.getForWeather(weather.icon);
      this.nextTemperature = tomorrow.temp.day.toInt().toString();
      this.nextIcon = WeatherIcon.getForWeather(tomorrow.weather.first.icon);
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuIcon = 'assets/menu.svg';
    final menuIconSize = 24.0;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: NavDrawerIcon(
          menuIcon: menuIcon,
          iconSize: menuIconSize,
        ),
      ),
      drawer: NavDrawer(),
      body: Container(
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
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}

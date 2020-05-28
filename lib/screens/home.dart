import 'package:flutter/material.dart';
import '../views/nav_drawer_icon.dart';
import '../models/forecast.dart';
import '../models/weather_icon.dart';
import '../utils/secrets_loader.dart';
import '../data/weather_api.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../views/forecast_view.dart';
import './weather_settings.dart';

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

  final bottomSheet = WeatherSettingsSheet();

  final random = new Random();
  double nextInRange(int min, int max) =>
      min + random.nextInt(max - min).toDouble();

  @override
  void initState() {
    super.initState();
    SecretLoader(secretPath: SECRETS_FILE_PATH)
        .load()
        .then((secrets) {
          final apiKey = secrets[API_KEY];
          final weatherApi = WeatherApi(apiKey);
          final lat = nextInRange(-90, 90);
          final lng = nextInRange(-180, 180);
          return weatherApi.getWeatherForecast(lat, lng);
        })
        .then((value) => updateForecast(value))
        .catchError((e) => showInSnackBar(e.message));
  }

  updateForecast(Forecast forecast) {
    setState(() {
      final weather = forecast.current.weather.first;
      final tomorrow = forecast.daily.first;
      // Since we are using timezone to display the location name,
      // we need to clean up the string a little bit. This includes
      // splitting the location name from the timezone string
      // (usually in AREA/LOCATION format). We also remove all the
      // symbols from the text.
      String timezone = forecast.timezone;
      timezone = timezone.contains("/") ? timezone.split("/").last : timezone;
      this.location = timezone.replaceAll(new RegExp(r'[^\w\s]+'), '');
      this.description = weather.main;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: NavDrawerIcon(
          menuIcon: menuIcon,
          iconSize: menuIconSize,
          onPressed: () => bottomSheet.show(context),
        ),
      ),
      //drawer: NavDrawer(),
      body: this.temperature.isNotEmpty
          ? buildForecastContent()
          : buildProgressBar(),
    );
  }

  SpinKitPulse buildProgressBar() {
    return SpinKitPulse(
      color: Colors.black38,
      size: 150.0,
    );
  }

  ForecastWidget buildForecastContent() {
    return ForecastWidget(
        description: description,
        location: location,
        temperature: temperature,
        icon: icon,
        nextTemperature: nextTemperature,
        nextIcon: nextIcon);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}

import 'dart:collection';

import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/utils/secrets_loader.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SECRETS_FILE_PATH = "assets/secrets.json";
const API_KEY = "OpenWeatherApiKey";

@singleton
class WeatherRepository {
  final WeatherApi api;
  SharedPreferences prefs;

  bool isInitialized = false;
  bool _isUnitChanged = false;

  final memCache = HashMap<String, Forecast>();

  WeatherRepository(this.api);

  String get city {
    return prefs.getString("city") ?? "";
  }

  String get unit {
    return prefs.getString("unit") ?? "";
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    if (api.apiKey == null) {
      final secrets = await SecretLoader(secretPath: SECRETS_FILE_PATH).load();
      final apiKey = secrets[API_KEY];
      api.setApiKey(apiKey);
    }
    this.isInitialized = true;
  }

  updateCity(String city) async {
    prefs.setString("city", city);
  }

  updateUnit(String unit) async {
    prefs.setString("unit", unit);
    _isUnitChanged = true;
  }

  Future<Forecast> fetchForecast() async {
    try {
      final forecast = memCache.containsKey(city) && !_isUnitChanged
          ? memCache[city]
          : await api.getWeatherForecast(city, unit);
      memCache[city] = forecast;
      _isUnitChanged = false;
      return forecast;
    } catch (e) {
      return Future.error(WeatherError());
    }
  }
}

class WeatherError extends Error {}

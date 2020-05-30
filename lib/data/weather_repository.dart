import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import 'package:flutter_weather_app/utils/secrets_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SECRETS_FILE_PATH = "assets/secrets.json";
const API_KEY = "OpenWeatherApiKey";

class WeatherRepository {
  final WeatherApi api;
  SharedPreferences prefs;

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
  }

  updateCity(String city) async {
    prefs.setString("city", city);
  }

  updateUnit(String unit) async {
    prefs.setString("unit", unit);
  }

  Future<ForecastViewModel> fetchForecast() async {
    try {
      final forecast = await api.getWeatherForecast(city, unit);
      return ForecastViewModel.fromForecast(forecast);
    } catch (e) {
      return Future.error(WeatherError());
    }
  }
}

class WeatherError extends Error {}

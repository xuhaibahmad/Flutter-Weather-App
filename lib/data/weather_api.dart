import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../models/forecast.dart';
import 'dart:convert';

const String BASE_URL = "https://api.openweathermap.org/data/2.5/forecast";
const CELCIUS = "C";
const FAHRENHEIT = "F";
const METRIC = "metric";
const IMPERIAL = "imperial";

@singleton
class WeatherApi {
  String apiKey;

  setApiKey(String key) {
    this.apiKey = key;
  }

  Future<Forecast> getWeatherForecast(String city, String unit) async {
    final cityValue = city.toLowerCase();
    final unitValue = unit == CELCIUS ? METRIC : IMPERIAL;
    final url = "$BASE_URL?q=$cityValue&appid=$apiKey&units=$unitValue";
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return Forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}

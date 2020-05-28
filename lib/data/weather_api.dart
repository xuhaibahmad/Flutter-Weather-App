import 'package:http/http.dart' as http;
import '../models/forecast.dart';
import 'dart:convert';

const String BASE_URL = "https://api.openweathermap.org/data/2.5/onecall";

class WeatherApi {
  String apiKey;

  setApiKey(String key) {
    this.apiKey = key;
  }

  Future<Forecast> getWeatherForecast(double lat, double lng) async {
    final String url = "$BASE_URL?lat=$lat&lon=$lng&appid=$apiKey&units=metric";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error occurred while fetching weather forecast");
    }
  }
}

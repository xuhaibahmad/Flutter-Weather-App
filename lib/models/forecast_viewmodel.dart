import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/weather_icon.dart';

class ForecastViewModel {
  final String errorMessage;
  final String description;
  final String location;
  final String temperature;
  final String icon;
  final String nextTemperature;
  final String nextIcon;

  ForecastViewModel({
    this.errorMessage,
    this.description,
    this.location,
    this.temperature,
    this.icon,
    this.nextTemperature,
    this.nextIcon,
  });

  factory ForecastViewModel.fromForecast(Forecast forecast) {
    final weather = forecast.current.weather.first;
    final tomorrow = forecast.daily.first;
    // Since we are using timezone to display the location name,
    // we need to clean up the string a little bit. This includes
    // splitting the location name from the timezone string
    // (usually in AREA/LOCATION format). We also remove all the
    // symbols from the text.
    String timezone = forecast.timezone;
    timezone = timezone.contains("/") ? timezone.split("/").last : timezone;
    return ForecastViewModel(
      location: timezone.replaceAll(new RegExp(r'[^\w\s]+'), ''),
      description: weather.main,
      temperature: forecast.current.temp.toInt().toString(),
      icon: WeatherIcon.getForWeather(weather.icon),
      nextTemperature: tomorrow.temp.day.toInt().toString(),
      nextIcon: WeatherIcon.getForWeather(tomorrow.weather.first.icon),
    );
  }
}

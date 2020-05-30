import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/weather_icon.dart';
import '../utils/string_ext.dart';

class ForecastViewModel extends Equatable {
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
    final today = forecast.list.first;
    final todayDate = DateTime.fromMillisecondsSinceEpoch(today.dt * 1000);
    final tomorrow = forecast.list.firstWhere((f) {
      final nextDate = DateTime.fromMillisecondsSinceEpoch(f.dt * 1000);
      return todayDate.difference(nextDate).inDays == -1;
    });
    // Since we are using timezone to display the location name,
    // we need to clean up the string a little bit. This includes
    // splitting the location name from the timezone string
    // (usually in AREA/LOCATION format). We also remove all the
    // symbols from the text.
    return ForecastViewModel(
      location: forecast.city.name,
      description: today.weather.first.description.capitalizeWords(),
      temperature: today.main.temp.round().toString(),
      icon: WeatherIcon.getForWeather(today.weather.first.icon),
      nextTemperature: tomorrow.main.temp.round().toString(),
      nextIcon: WeatherIcon.getForWeather(tomorrow.weather.first.icon),
    );
  }

  @override
  List<Object> get props => [
        errorMessage,
        description,
        location,
        temperature,
        icon,
        nextTemperature,
        nextIcon,
      ];
}

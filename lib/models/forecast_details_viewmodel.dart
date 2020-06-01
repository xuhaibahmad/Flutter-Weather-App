import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/weather_icon.dart';
import 'package:intl/intl.dart';
import '../utils/string_ext.dart';
import "package:collection/collection.dart";

class ForecastDetailsViewModel extends Equatable {
  final String date;
  final String description;
  final String location;
  final String temperature;
  final String minTemp;
  final String maxTemp;
  final String pressure;
  final String humidity;
  final List<WeekForecastViewModel> weekTemps;
  final List<TodayForecastViewModel> todayTemps;

  ForecastDetailsViewModel({
    this.date,
    this.description,
    this.location,
    this.temperature,
    this.todayTemps,
    this.weekTemps,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity,
  });

  factory ForecastDetailsViewModel.fromForecast(Forecast forecast) {
    final date = DateTime.now();
    final today = forecast.list.firstWhere((e) {
      final d = DateTime.fromMillisecondsSinceEpoch(e.dt * 1000);
      return d.day == date.day;
    });
    final todayDate = DateTime.fromMillisecondsSinceEpoch(today.dt * 1000);
    final temps = groupBy(
      forecast.list,
      (f) => DateTime.fromMillisecondsSinceEpoch(f.dt * 1000).day,
    );
    final todaysTemps = temps[date.day]
        .map((w) => TodayForecastViewModel.fromWeather(w))
        .toList();
    final weekTemps = temps.values
        .map((e) => e.first)
        .map((w) => WeekForecastViewModel.fromWeather(w))
        .toList();

    return ForecastDetailsViewModel(
      date: DateFormat(DateFormat.ABBR_MONTH_DAY).format(todayDate),
      location: forecast.city.name,
      temperature: today.main.temp.round().toString(),
      description: today.weather.first.description.capitalizeWords(),
      todayTemps: todaysTemps,
      weekTemps: weekTemps,
      minTemp: "${today.main.tempMin.round()}°C",
      maxTemp: "${today.main.tempMax.round()}°C",
      pressure: "${today.main.pressure.round()} Pa",
      humidity: "${today.main.humidity}%",
    );
  }

  @override
  List<Object> get props => [
        date,
        description,
        location,
        temperature,
        todayTemps,
        minTemp,
        maxTemp,
        pressure,
        humidity,
      ];
}

class TodayForecastViewModel extends Equatable {
  final String time;
  final String icon;
  final String temperature;

  TodayForecastViewModel({this.time, this.icon, this.temperature});

  factory TodayForecastViewModel.fromWeather(ListElement element) {
    final date = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
    return TodayForecastViewModel(
      time: date.hour > 12 ? "${date.hour - 12} PM" : "${date.hour} AM",
      icon: WeatherIcon.getForWeather(element.weather.first.icon),
      temperature: "${element.main.temp.round()}",
    );
  }

  @override
  List<Object> get props => [
        time,
        icon,
        temperature,
      ];
}

class WeekForecastViewModel extends Equatable {
  final String day;
  final String minTemp;
  final String maxTemp;
  final String icon;

  WeekForecastViewModel({this.day, this.minTemp, this.maxTemp, this.icon});

  factory WeekForecastViewModel.fromWeather(ListElement element) {
    const List<String> dayNames = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    final date = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
    return WeekForecastViewModel(
      day: dayNames[date.weekday - 1],
      minTemp: "${element.main.temp.round()}°C",
      maxTemp: "${element.main.temp.round()}°C",
      icon: WeatherIcon.getForWeather(element.weather.first.icon),
    );
  }

  @override
  List<Object> get props => [day, minTemp, maxTemp, icon];
}

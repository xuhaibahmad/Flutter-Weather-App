part of 'weather_settings_bloc.dart';

abstract class WeatherSettingsEvent extends Equatable {
  const WeatherSettingsEvent();
}

class OpenWeatherSettingsEvent extends WeatherSettingsEvent {
  const OpenWeatherSettingsEvent();
  @override
  List<Object> get props => [];
}

class UpdateWeatherPrefsEvent extends WeatherSettingsEvent {
  final String city;
  final String unit;

  const UpdateWeatherPrefsEvent(this.city, this.unit);

  @override
  List<Object> get props => [city, unit];
}

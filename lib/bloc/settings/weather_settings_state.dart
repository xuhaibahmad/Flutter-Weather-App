part of 'weather_settings_bloc.dart';

abstract class WeatherSettingsState {
  const WeatherSettingsState();
}

class WeatherSettingsInitialState extends WeatherSettingsState {
  const WeatherSettingsInitialState();
}

class WeatherSettingsOpenState extends WeatherSettingsState {
  final String city;
  final String unit;
  const WeatherSettingsOpenState(this.city, this.unit);
}

class WeatherSettingsErrorState extends WeatherSettingsState {
  final WeatherError error;
  WeatherSettingsErrorState(this.error);
}

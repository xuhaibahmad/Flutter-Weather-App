import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:injectable/injectable.dart';

part 'weather_settings_event.dart';
part 'weather_settings_state.dart';

@singleton
class WeatherSettingsBloc
    extends Bloc<WeatherSettingsEvent, WeatherSettingsState> {
  final WeatherRepository repository;

  WeatherSettingsBloc(this.repository);

  @override
  WeatherSettingsState get initialState => WeatherSettingsInitialState();

  @override
  Stream<WeatherSettingsState> mapEventToState(
    WeatherSettingsEvent event,
  ) async* {
    if (event is OpenWeatherSettingsEvent) {
      try {
        final city = repository.city;
        final unit = repository.unit;
        yield WeatherSettingsOpenState(city, unit);
      } catch (e) {
        yield WeatherSettingsErrorState(e);
      }
    } else if (event is UpdateWeatherPrefsEvent) {
      try {
        await repository.updateCity(event.city);
        await repository.updateUnit(event.unit);
        yield WeatherSettingsInitialState();
      } catch (e) {
        yield WeatherSettingsErrorState(e);
      }
    }
  }
}

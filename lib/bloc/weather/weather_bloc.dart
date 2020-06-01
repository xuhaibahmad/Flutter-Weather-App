import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import 'package:injectable/injectable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@singleton
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository);

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (!repository.isInitialized) {
      await repository.init();
    }
    if (event is GetWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final forecast = await repository.fetchForecast();
        yield WeatherLoadedState(ForecastViewModel.fromForecast(forecast));
      } on WeatherError catch (_) {
        yield WeatherErrorState();
      }
    }
  }
}

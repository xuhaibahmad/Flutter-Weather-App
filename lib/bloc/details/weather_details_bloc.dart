import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/models/forecast_details_viewmodel.dart';
import 'package:injectable/injectable.dart';

part 'weather_details_event.dart';
part 'weather_details_state.dart';

@singleton
class WeatherDetailsBloc
    extends Bloc<WeatherDetailsEvent, WeatherDetailsState> {
  final WeatherRepository repository;

  WeatherDetailsBloc(this.repository);

  @override
  WeatherDetailsState get initialState => WeatherDetailsInitialState();

  @override
  Stream<WeatherDetailsState> mapEventToState(
    WeatherDetailsEvent event,
  ) async* {
    if (event is GetWeatherDetailsEvent) {
      yield WeatherDetailsLoadingState();
      try {
        final forecast = await repository.fetchForecast();
        yield WeatherDetailsLoadedState(
            ForecastDetailsViewModel.fromForecast(forecast));
      } on WeatherError catch (_) {
        yield WeatherDetailsErrorState();
      }
    }
  }
}

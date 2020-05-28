import 'dart:io';

import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/utils/math_utils.dart';
import 'package:flutter_weather_app/utils/secrets_loader.dart';
import 'package:mobx/mobx.dart';

part 'weather_store.g.dart';

const SECRETS_FILE_PATH = "assets/secrets.json";
const API_KEY = "OpenWeatherApiKey";

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(WeatherApi api) : super(api);
}

enum StoreState { initial, loading, loaded }

abstract class _WeatherStore with Store {
  final WeatherApi api;

  _WeatherStore(this.api);

  @observable
  ObservableFuture<Forecast> _forecastFuture;

  @observable
  ForecastViewModel forecastViewModel;

  @observable
  String error;

  @computed
  StoreState get state {
    if (_forecastFuture == null ||
        _forecastFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _forecastFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getForecast() async {
    error = null;
    if (api.apiKey == null) {
      final secrets = await SecretLoader(secretPath: SECRETS_FILE_PATH).load();
      final apiKey = secrets[API_KEY];
      api.setApiKey(apiKey);
    }
    final lat = nextInRange(-90, 90);
    final lng = nextInRange(-180, 180);
    _forecastFuture = ObservableFuture(api.getWeatherForecast(lat, lng));
    try {
      final forecast = await _forecastFuture;
      forecastViewModel = ForecastViewModel.fromForecast(forecast);
    } catch (e) {
      error = e.message;
    }
  }
}

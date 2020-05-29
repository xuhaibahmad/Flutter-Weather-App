import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import 'package:flutter_weather_app/utils/secrets_loader.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'weather_store.g.dart';

const SECRETS_FILE_PATH = "assets/secrets.json";
const API_KEY = "OpenWeatherApiKey";

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(WeatherApi api) : super(api);
}

enum StoreState { initial, loading, loaded }

abstract class _WeatherStore with Store {
  final WeatherApi api;
  SharedPreferences prefs;

  _WeatherStore(this.api);

  assignPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

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

  @computed
  String get city {
    return prefs.getString("city") ?? "";
  }

  @computed
  String get unit {
    return prefs.getString("unit") ?? "";
  }

  @action
  updateCity(String city) async {
    prefs.setString("city", city);
  }

  @action
  updateUnit(String unit) async {
    prefs.setString("unit", unit);
  }

  @action
  Future getForecast() async {
    error = null;
    if (api.apiKey == null) {
      final secrets = await SecretLoader(secretPath: SECRETS_FILE_PATH).load();
      final apiKey = secrets[API_KEY];
      api.setApiKey(apiKey);
    }
    _forecastFuture = ObservableFuture(api.getWeatherForecast(city, unit));
    try {
      final forecast = await _forecastFuture;
      forecastViewModel = ForecastViewModel.fromForecast(forecast);
    } catch (e) {
      error = e.message;
    }
  }
}

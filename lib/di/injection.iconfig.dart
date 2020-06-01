// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/bloc/settings/weather_settings_bloc.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/bloc/details/weather_details_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  //Eager singletons must be registered in the right order
  g.registerSingleton<WeatherApi>(WeatherApi());
  g.registerSingleton<WeatherRepository>(WeatherRepository(g<WeatherApi>()));
  g.registerSingleton<WeatherSettingsBloc>(
      WeatherSettingsBloc(g<WeatherRepository>()));
  g.registerSingleton<WeatherBloc>(WeatherBloc(g<WeatherRepository>()));
  g.registerSingleton<WeatherDetailsBloc>(
      WeatherDetailsBloc(g<WeatherRepository>()));
}

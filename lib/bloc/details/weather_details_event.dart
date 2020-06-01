part of 'weather_details_bloc.dart';

abstract class WeatherDetailsEvent extends Equatable {
  const WeatherDetailsEvent();
}

class GetWeatherDetailsEvent extends WeatherDetailsEvent {
  const GetWeatherDetailsEvent();
  @override
  List<Object> get props => [];
}

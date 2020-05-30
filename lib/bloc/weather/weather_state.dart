part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState();
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final ForecastViewModel viewModel;
  const WeatherLoadedState(this.viewModel);
  @override
  List<Object> get props => [viewModel];
}

class WeatherErrorState extends WeatherState {
  const WeatherErrorState();
  @override
  List<Object> get props => [];
}

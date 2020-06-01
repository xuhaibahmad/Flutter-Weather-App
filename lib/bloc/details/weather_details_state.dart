part of 'weather_details_bloc.dart';

abstract class WeatherDetailsState extends Equatable {
  const WeatherDetailsState();
}

class WeatherDetailsInitialState extends WeatherDetailsState {
  @override
  List<Object> get props => [];
}

class WeatherDetailsLoadingState extends WeatherDetailsState {
  @override
  List<Object> get props => [];
}

class WeatherDetailsErrorState extends WeatherDetailsState {
  @override
  List<Object> get props => [];
}

class WeatherDetailsLoadedState extends WeatherDetailsState {
  final ForecastDetailsViewModel viewModel;
  WeatherDetailsLoadedState(this.viewModel);
  @override
  List<Object> get props => [];
}

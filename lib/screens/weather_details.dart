import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/details/weather_details_bloc.dart';
import 'package:flutter_weather_app/di/injection.dart';
import 'package:flutter_weather_app/models/forecast_details_viewmodel.dart';
import 'package:flutter_weather_app/views/error_view.dart';
import 'package:flutter_weather_app/views/forecast_details_view.dart';
import 'package:flutter_weather_app/views/progress_view.dart';

class WeatherDetails extends StatefulWidget implements AutoRouteWrapper {
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<WeatherDetailsBloc>(),
        child: this,
      );
}

class _WeatherDetailsState extends State<WeatherDetails> {
  WeatherDetailsBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= BlocProvider.of<WeatherDetailsBloc>(context)
      ..add(GetWeatherDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<WeatherDetailsBloc, WeatherDetailsState>(
        builder: (context, state) {
          if (state is WeatherDetailsLoadedState) {
            return buildForecastDetails(state.viewModel);
          } else if (state is WeatherDetailsErrorState) {
            return buildError();
          } else {
            return buildLoading();
          }
        },
      ),
    );
  }

  Widget buildLoading() => ProgressView();

  Widget buildForecastDetails(ForecastDetailsViewModel viewModel) =>
      ForecastDetailsView(viewModel: viewModel);

  Widget buildError() => ErrorView();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}

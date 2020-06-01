import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/settings/weather_settings_bloc.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/di/injection.dart';
import 'package:flutter_weather_app/router/router.gr.dart';
import 'package:flutter_weather_app/views/error_view.dart';
import 'package:flutter_weather_app/views/progress_view.dart';
import '../views/nav_drawer_icon.dart';
import '../views/forecast_view.dart';
import './weather_settings.dart';

class Home extends StatefulWidget implements AutoRouteWrapper {
  @override
  _HomeState createState() => _HomeState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (_) => getIt<WeatherBloc>(),
          ),
          BlocProvider<WeatherSettingsBloc>(
            create: (_) => getIt<WeatherSettingsBloc>(),
          ),
        ],
        child: this,
      );
}

class _HomeState extends State<Home> {
  WeatherBloc weatherBloc;
  WeatherSettingsBloc settingsBloc;

  final bottomSheet = WeatherSettingsSheet();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    settingsBloc ??= BlocProvider.of<WeatherSettingsBloc>(context);
    weatherBloc ??= BlocProvider.of<WeatherBloc>(context)
      ..add(GetWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherSettingsBloc, WeatherSettingsState>(
      listener: (context, state) {
        if (state is WeatherSettingsOpenState) {
          openBottomSheet(context, state.city, state.unit);
        }
      },
      child: BlocBuilder<WeatherSettingsBloc, WeatherSettingsState>(
        builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: NavDrawerIcon(
                menuIcon: 'assets/menu.svg',
                iconSize: 24.0,
                onPressed: () => settingsBloc.add(OpenWeatherSettingsEvent()),
              ),
            ),
            body: BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is WeatherInitialState) {
                  weatherBloc.add(GetWeatherEvent());
                }
              },
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadedState) {
                    return buildForecast(state.viewModel);
                  } else if (state is WeatherErrorState) {
                    return buildError();
                  } else {
                    return buildLoading();
                  }
                },
              ),
            )),
      ),
    );
  }

  Widget buildLoading() => ProgressView();

  Widget buildForecast(viewModel) => ForecastWidget(
        viewModel: viewModel,
        onPressed: () =>
            ExtendedNavigator.of(context).pushNamed(Routes.detailsPage),
      );

  Widget buildError() => ErrorView(
        onPressed: () => settingsBloc.add(OpenWeatherSettingsEvent()),
      );

  openBottomSheet(context, storedCity, storedUnit) {
    bottomSheet.show(
      context,
      storedCity,
      storedUnit,
      (city, unit) => onSubmit(context, city, unit),
    );
  }

  onSubmit(context, city, unit) {
    settingsBloc.add(UpdateWeatherPrefsEvent(city, unit));
    weatherBloc.add(GetWeatherEvent());
    Navigator.pop(context);
  }
}

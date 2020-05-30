import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/bloc/weather_settings/weather_settings_bloc.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/router/router.gr.dart';
import '../views/nav_drawer_icon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../views/forecast_view.dart';
import './weather_settings.dart';

class Home extends StatefulWidget implements AutoRouteWrapper {
  final WeatherRepository repository;

  const Home({Key key, @required this.repository}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (_) => WeatherBloc(repository),
          ),
          BlocProvider<WeatherSettingsBloc>(
            create: (_) => WeatherSettingsBloc(repository),
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

  Widget buildLoading() {
    return SpinKitPulse(color: Colors.black38, size: 150.0);
  }

  Widget buildForecast(viewModel) {
    return ForecastWidget(
      viewModel: viewModel,
      onPressed: () => ExtendedNavigator.of(context).pushNamed(
        Routes.detailsPage,
        arguments: WeatherDetailsArguments(viewModel: viewModel),
      ),
    );
  }

  Widget buildError() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/071-meteor.svg",
              width: 300,
              height: 300,
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Houston, we have a problem!",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Hmm... It looks like either you are not connected to the internet or the selected location is incorrect.",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () => settingsBloc.add(OpenWeatherSettingsEvent()),
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text("CHANGE LOCATION"),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

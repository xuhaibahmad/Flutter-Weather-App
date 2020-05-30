import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/bloc/weather_settings/weather_settings_bloc.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';
import '../views/nav_drawer_icon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../views/forecast_view.dart';
import './weather_settings.dart';

class Home extends StatelessWidget {
  WeatherBloc weatherBloc;
  WeatherSettingsBloc settingsBloc;
  final bottomSheet = WeatherSettingsSheet();

  @override
  Widget build(BuildContext context) {
    weatherBloc ??= BlocProvider.of<WeatherBloc>(context);
    settingsBloc ??= BlocProvider.of<WeatherSettingsBloc>(context);
    weatherBloc.add(GetWeatherEvent());
    return BlocListener<WeatherSettingsBloc, WeatherSettingsState>(
      listener: (context, state) {
        if (state is WeatherSettingsOpenState) {
          openBottomSheet(context, state.city, state.unit);
        }
      },
      child: BlocBuilder<WeatherSettingsBloc, WeatherSettingsState>(
        builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: NavDrawerIcon(
                menuIcon: 'assets/menu.svg',
                iconSize: 24.0,
                onPressed: () => settingsBloc.add(OpenWeatherSettingsEvent()),
              ),
            ),
            //drawer: NavDrawer(),
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

  Widget buildForecast(ForecastViewModel viewModel) {
    return ForecastWidget(viewModel: viewModel);
  }

  Widget buildError() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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

  openBottomSheet(BuildContext context, String storedCity, String storedUnit) {
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

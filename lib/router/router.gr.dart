// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/screens/weather_details.dart';
import 'package:flutter_weather_app/models/forecast_viewmodel.dart';

abstract class Routes {
  static const homePage = '/';
  static const detailsPage = '/details-page';
  static const all = {
    homePage,
    detailsPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        if (hasInvalidArgs<HomeArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<HomeArguments>(args);
        }
        final typedArgs = args as HomeArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              Home(key: typedArgs.key, repository: typedArgs.repository)
                  .wrappedRoute(context),
          settings: settings,
        );
      case Routes.detailsPage:
        if (hasInvalidArgs<WeatherDetailsArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WeatherDetailsArguments>(args);
        }
        final typedArgs = args as WeatherDetailsArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => WeatherDetails(
              key: typedArgs.key, viewModel: typedArgs.viewModel),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//Home arguments holder class
class HomeArguments {
  final Key key;
  final WeatherRepository repository;
  HomeArguments({this.key, @required this.repository});
}

//WeatherDetails arguments holder class
class WeatherDetailsArguments {
  final Key key;
  final ForecastViewModel viewModel;
  WeatherDetailsArguments({this.key, @required this.viewModel});
}
